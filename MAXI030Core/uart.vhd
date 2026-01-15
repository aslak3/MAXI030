library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart is
	port (	clock : in STD_LOGIC;							-- Master clock
			reset : in STD_LOGIC;							-- Master reset
			trigger : in STD_LOGIC;							-- There's a byte to send
			write_data : in STD_LOGIC_VECTOR (7 downto 0);	-- Data to write
			read_data : out STD_LOGIC_VECTOR (7 downto 0);	-- Data we have read
			framing_error_set : out STD_LOGIC;				-- Start or stop error
			tx_ready : out STD_LOGIC;						-- Transmitter is ready = 1
			rx_ready_set : out STD_LOGIC;					-- Got a full byte
			tx : out STD_LOGIC;
			rx : in STD_LOGIC
		);
end entity;

architecture behavioral of uart is
	type T_STATE is (IDLE, START, DATA, STOP);
begin
	process (reset, clock)
		-- 115200 with 20MHz input clock, actual baud rate c. 114942, an error of 0.3%
		variable baud_counter : INTEGER range 0 to 174 := 0;
		variable sending : STD_LOGIC := '0';
		variable bit_counter : INTEGER range 0 to 7 := 0;
		variable state : T_STATE := IDLE;
	begin
		if (reset = '1') then
			state := IDLE;
		elsif (clock'Event and clock = '1') then
			tx_ready <= not sending;
			if (sending = '1') then
				if (baud_counter = 0) then
					baud_counter := 174;
				end if;
				baud_counter := baud_counter - 1;
			end if;

			case state is
				when IDLE =>
					tx <= '1';
					sending := '0';
					baud_counter := 174;
					if (trigger = '1') then
						sending := '1';
						state := START;
					end if;

				when START =>
					tx <= '0';
					if (baud_counter = 0) then
						state := DATA;
						bit_counter := 0;
					end if;

				when DATA =>
					tx <= write_data (bit_counter);
					if (baud_counter = 0) then
						if (bit_counter = 7) then
							state := STOP;
						else
							bit_counter := bit_counter + 1;
						end if;
					end if;

				when STOP =>
					tx <= '1';
					if (baud_counter = 0) then
						state := IDLE;
					end if;
			end case;
		end if;
	end process;

	process (reset, clock)
		variable baud_counter : INTEGER range 0 to 174 := 0;
		variable receiving : STD_LOGIC := '0';
		variable bit_counter : INTEGER range 0 to 7 := 0;
		variable state : T_STATE := IDLE;
	begin
		if (reset = '1') then
			state := IDLE;
		elsif (clock'Event and clock = '1') then
			rx_ready_set <= '0';
			if (receiving = '1') then
				if (baud_counter = 0) then
					baud_counter := 174;
				end if;
				baud_counter := baud_counter - 1;
			end if;

			case state is
				when IDLE =>
					framing_error_set <= '0';
					receiving := '0';
					-- Center over the incoming bit
					baud_counter := 174 / 2;
					if (rx = '0') then
						receiving := '1';
						state := START;
					end if;

				when START =>
					if (baud_counter = 0) then
						if (rx = '1') then
							framing_error_set <= '1';
						end if;
						bit_counter := 0;
						state := DATA;
					end if;

				when DATA =>
					read_data (bit_counter) <= rx;
					if (baud_counter = 0) then
						if (bit_counter = 7) then
							state := STOP;
						else
							bit_counter := bit_counter + 1;
						end if;
					end if;

				when STOP =>
					if (baud_counter = 0) then
						if (rx = '0') then
							framing_error_set <= '1';
						end if;
						rx_ready_set <= '1';
						state := IDLE;
					end if;
			end case;
		end if;
	end process;
end architecture;
