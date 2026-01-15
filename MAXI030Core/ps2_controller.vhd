-- PS/2 edge finder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ps2_edge_finder is
	port (	clock : in STD_LOGIC;
			edge_found : out STD_LOGIC;		-- '1' when a falling edge is found
			ps2_clock : in STD_LOGIC);			-- The input clock to look at
end entity;

architecture behavioral of ps2_edge_finder is
	signal edge_finder : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
begin
	process (clock)
	begin
		if (clock'event and clock = '1') then
			-- Shift the incoming clock signal in
			edge_finder <= edge_finder (6 downto 0) & ps2_clock;
			-- Check for a match against a falling edge
			if (edge_finder = x"f0") then
				edge_found <= '0';
			elsif (edge_finder = x"0f") then
				edge_found <= '1';
			end if;
		end if;
	end process;
end architecture;

-- PS2 RX Shifter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ps2_rx_shifter is
	port (	clock : in STD_LOGIC;
			edge_found : in STD_LOGIC;								-- Has a clock edge been found?
			rx_scancode : out STD_LOGIC_VECTOR (7 downto 0);		-- What have we shifted in
			scancode_ready_set : out STD_LOGIC;
			parity_error : out STD_LOGIC;
			ps2_data : in STD_LOGIC;								-- PS2 data pin
			tx_ready : in STD_LOGIC);
end entity;

architecture behavioral of ps2_rx_shifter is
	signal byte_buffer : STD_LOGIC_VECTOR (7 downto 0) := x"00";	-- Currently shifting byte out
	signal byte_counter : integer  range 0 to 7;					-- Byte shifting counter (0..7)
	signal parity_check : STD_LOGIC := '0';
	signal scancode_rx_counter : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
	type T_STATE is (RX_START, RX_BYTE, RX_ODD_PARITY, RX_STOP);
	signal state : T_STATE := RX_START;
	signal last_edge_found : STD_LOGIC := '0';
begin
	process (clock)
	begin
		if (clock'Event and clock = '1') then
			last_edge_found <= edge_found;
			scancode_ready_set <= '0';

			if (scancode_rx_counter = x"ffff") then
				state <= RX_START;
			end if;

			scancode_rx_counter <= scancode_rx_counter + '1';

			if (edge_found = '0' and last_edge_found = '1' and tx_ready = '1') then
				scancode_rx_counter <= (others => '0');

				case state is
					when RX_START =>
						parity_error <= '0';
						byte_counter <= 0;
						byte_buffer <= x"00";
						parity_check <= '1'; --'0';
						state <= RX_BYTE;

					when RX_BYTE =>
						parity_check <= parity_check xor ps2_data;
						byte_buffer (byte_counter) <= ps2_data;
						if (byte_counter = 7) then
							state <= RX_ODD_PARITY;
						end if;
						byte_counter <= byte_counter + 1;

					when RX_ODD_PARITY =>
						-- Check for an even number of ones: good!
						if (parity_check = not ps2_data) then
							-- No error
							parity_error <= '0';
						else
							parity_error <= '1';
						end if;
						rx_scancode <= byte_buffer;
						state <= RX_STOP;

					when RX_STOP =>
						scancode_ready_set <= '1';
						state <= RX_START;
				end case;
			end if;
		end if;
	end process;
end architecture;

-- PS/2 TX Shifter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ps2_tx_shifter is
	port (	clock : in STD_LOGIC;
			reset : in STD_LOGIC;								-- Global reset
			edge_found : in STD_LOGIC;							-- PS/2 falling clock edge?
			tx_command_byte : in STD_LOGIC_VECTOR (7 downto 0);	-- What we are shifting out
			tx_command_trigger : in STD_LOGIC;					-- Go signal
			tx_clock_driven : out STD_LOGIC;					-- Drive the clock pin?
			tx_data_driven : out STD_LOGIC;						-- Drive the data pin?
			ps2_clock : out STD_LOGIC;							-- PS/2 clock OUT
			ps2_data : out STD_LOGIC;							-- PS2 data pin OUT
			tx_ready : out STD_LOGIC);							-- TX is ready for another character
end entity;

architecture behavioral of ps2_tx_shifter is
	signal clock_counter : STD_LOGIC_VECTOR (8 downto 0) := (others => '0');
	signal byte_counter : integer range 0 to 7 := 0;	-- Byte shifting counter (0..7)
	signal parity_check : STD_LOGIC := '0';				-- Accumulated parity
	signal request_to_send1 : STD_LOGIC := '0';			-- Sending clock pulse?
	signal request_to_send2 : STD_LOGIC := '0';			-- Sending data pulse?
	signal request_to_send3 : STD_LOGIC := '0';			-- Sending data pulse?
	signal tx_busy : STD_LOGIC := '0';					-- Transmittion is busy
	type T_STATE is (TX_BYTE, TX_ODD_PARITY, TX_STOP, TX_END);
	signal state : T_STATE := TX_BYTE;
	signal last_edge_found : STD_LOGIC := '0';
begin
	process (clock, reset)
	begin
		if (reset = '1') then
			tx_clock_driven <= '0';
			tx_data_driven <= '0';
			request_to_send1 <= '0';
			request_to_send2 <= '0';
			request_to_send3 <= '0';
			tx_busy <= '0';
			tx_ready <= '1';
		elsif (clock'event and clock = '1') then
			last_edge_found <= edge_found;
			if (tx_command_trigger = '1') then
				-- Pull clock low to tell the device we want to tx
				clock_counter <= (others => '0');
				parity_check <= '0';
				request_to_send1 <= '1';
				tx_clock_driven <= '1';
				ps2_clock <= '0';
				tx_ready <= '0';
			end if;

			-- Send a "reqest to send" pulse on data
			if (request_to_send1 = '1') then
				if (clock_counter = "111111111") then
					request_to_send1 <= '0';
					tx_data_driven <= '1';
					ps2_data <= '0';
					clock_counter <= (others => '0');
					request_to_send2 <= '1';
				end if;
				clock_counter <= clock_counter + '1';
			end if;

			-- Send start bit, but at this point the device is not driving the clock
			if (request_to_send2 = '1') then
				if (clock_counter = "111111111") then
					request_to_send2 <= '0';
					tx_clock_driven <= '1';
					ps2_clock <= '1';
					request_to_send3 <= '1';
				end if;
				clock_counter <= clock_counter + '1';
			end if;

			-- Send start bit, but at this point the device is not driving the clock
			if (request_to_send3 = '1') then
				if (clock_counter = "111111111") then
					request_to_send3 <= '0';
					tx_clock_driven <= '0';
					tx_busy <= '1';
					byte_counter <= 0;
					state <= TX_BYTE;
				end if;
				clock_counter <= clock_counter + '1';
			end if;

			if (tx_busy = '1' and edge_found = '0' and last_edge_found = '1') then
				case state is
					when TX_BYTE =>
						-- Calculate the parity and send the bit
						parity_check <= parity_check xor tx_command_byte (byte_counter);
						ps2_data <= tx_command_byte (byte_counter);
						if (byte_counter = 7) then
							state <= TX_ODD_PARITY;
						end if;
						byte_counter <= byte_counter + 1;

					when TX_ODD_PARITY =>
						ps2_data <= not parity_check;
						state <= TX_STOP;

					when TX_STOP =>
						ps2_data <= '1';
						state <= TX_END;

					when TX_END =>
						tx_busy <= '0';
						tx_data_driven <= '0';
						tx_ready <= '1';
						state <= TX_BYTE;

				end case;
			end if;
		end if;
	end process;
end architecture;
