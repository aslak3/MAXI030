-- SPI bitshifting

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity spi_controller is
	port (	clock : in STD_LOGIC;								-- Ticker
			trigger : in STD_LOGIC;								-- Should we shift in and out or be idle?
			out_byte : in STD_LOGIC_VECTOR (7 downto 0);		-- What we are shifting out
			sclk : out STD_LOGIC;								-- The SPI clock line
			mosi : out STD_LOGIC);								-- The outbound data line
end entity;

architecture behavioral of spi_controller is
	signal out_state : STD_LOGIC_VECTOR (7 downto 0);			-- Currently shifting byte out
	signal in_state : STD_LOGIC_VECTOR (7 downto 0);			-- Ditto for in
	signal counter : STD_LOGIC_VECTOR (2 downto 0);				-- Byte shifting counter (0..7)
	signal running : STD_LOGIC := '0';							-- Are we shufting?
	signal tick : STD_LOGIC;									-- In or Out halves
begin

	process (clock)
	begin
		if (clock'Event and clock = '1') then
			if (trigger = '1') then
				-- Reset for byte transfer
				out_state <= out_byte;							-- Grab byte we are sending
				counter <= "000";								-- MSB will be first
				running <= '1';									-- Go!
				tick <= '0';									-- Start in input half
			else
				if (running = '1') then
					if (tick = '1') then
						-- Input; shift byte up one grabbing selected MISO
						out_state (7 downto 0) <= out_state (6 downto 0) & '0';
						counter <= counter + 1;
						if (counter = "111") then
							-- Done. Mark not running and grab input byte
							running <= '0';
						end if;					
					end if;
					-- Invert
					tick <= not tick;
				end if;
			end if;
		end if;
	end process;
	
	-- Send out MSB and set clock
	mosi <= out_state(7) when running = '1' else '0';
	sclk <= tick when running = '1' else '0';
end architecture;
