library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timer is
	port (	clock : in STD_LOGIC;							-- Master clock
			reset : in STD_LOGIC;							-- Master reset
			start_trigger : in STD_LOGIC;					-- Begin countdown and clear int
			stop_trigger : in STD_LOGIC;					-- Stop countdown
			start_value : in STD_LOGIC_VECTOR (23 downto 0);-- Max value
			rollover : out STD_LOGIC						-- Reached zero
	);
end entity;

architecture behavioral of timer is
	signal running : STD_LOGIC := '0';
	signal current_value : STD_LOGIC_VECTOR (23 downto 0) := (others => '0');
begin
	process (clock, reset)
	begin
		if (reset = '1') then
			current_value <= (others => '0');
			running <= '0';
		elsif (clock'event and clock = '1') then
			if (start_trigger = '1') then
				rollover <= '0';
				if (running = '0') then
					-- If not running, then run and reset value.
					running <= '1';
					current_value <= start_value;
				end if;
			elsif (stop_trigger = '1') then
				running <= '0';
			elsif (running = '1') then
				current_value <= current_value - 1;
				if (current_value = x"000000") then
					current_value <= start_value;
					rollover <= '1';
				end if;
			end if;
		end if;
	end process;
end architecture;

