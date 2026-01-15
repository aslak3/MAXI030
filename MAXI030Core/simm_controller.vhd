-- SIMM entity

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.P_CORE.ALL;

entity simm_controller is
	port  (	reset : in STD_LOGIC;
			clock : in STD_LOGIC;
			simm : in STD_LOGIC;
			as : in STD_LOGIC;
			ds : in STD_LOGIC;
			rn_w : in STD_LOGIC;
			bank_addr : in STD_LOGIC;
			slot_addr : in STD_LOGIC;
			byte_selects : in STD_LOGIC_VECTOR (3 downto 0);
			write : out STD_LOGIC;
			ras0 : out STD_LOGIC_VECTOR (3 downto 0);
			ras1 : out STD_LOGIC_VECTOR (3 downto 0);
			cas : out STD_LOGIC_VECTOR (3 downto 0);
			waitstate : out STD_LOGIC;
			mux_select : out STD_LOGIC);
end entity;

architecture behavioral of simm_controller is
	type DRAM_STATE is (IDLE, MEMRW1, MEMRW2, REFRESH1, REFRESH2, REFRESH3, REFRESH4);  -- Define the states
begin
	process (reset, clock)
		variable refresh_count : INTEGER range 0 to 250 := 0;
		variable state : DRAM_STATE := IDLE;
		variable needs_refresh : STD_LOGIC := '0';
	begin
		if (reset = '1') then
			write <= '0';
			mux_select <= '1';
			ras0 <= "0000";
			ras1 <= "0000";
			cas <= "0000";
			waitstate <= '1';
			state := IDLE;
		elsif (clock'event and clock = '1') then
			refresh_count := refresh_count + 1;
			if (refresh_count = 250) then
				refresh_count := 0;
				needs_refresh := '1';
			end if;

			case state is
				when IDLE =>
					write <= '0';
					mux_select <= '0';
					ras0 <= "0000";
					ras1 <= "0000";
					cas <= "0000";
					waitstate <= '1';

					if (needs_refresh = '1') then
						needs_refresh := '0';
						state := REFRESH1;
					elsif (simm = '1' and ds = '1' and as = '1') then
						write <= not rn_w;
						if (slot_addr = '0') then
							if (bank_addr = '0') then
								ras0 <= "0101";
							else
								ras0 <= "1010";
							end if;
						else
							if (bank_addr = '1') then
								ras1 <= "0101";
							else
								ras1 <= "1010";
							end if;
						end if;
						state := MEMRW1;
					else
						state := IDLE;
					end if;

				when MEMRW1 =>
					mux_select <= '1';
					state := MEMRW2;

				when MEMRW2 =>
					if (rn_w = '0') then
						-- Writing? Select only needed bytes
						cas <= byte_selects;
					else
						-- Reading? Select them all, needed for cache
						cas <= "1111";
					end if;

					waitstate <= '0';
					if (as = '1') then
						state := MEMRW2;
					else
						state := IDLE;
					end if;

				when REFRESH1 =>
					cas <= "1111";
					state := REFRESH2;

				when REFRESH2 =>
					ras0 <= "1111";
					ras1 <= "1111";
					state := REFRESH3;

				when REFRESH3 =>
					cas <= "0000";
					state := REFRESH4;

				when REFRESH4 =>
					ras0 <= "0000";
					ras1 <= "0000";
					state := IDLE;
			end case;
		end if;
	end process;
end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity simm_mux is
	port  ( mux_select : in STD_LOGIC;
			addr_in : in STD_LOGIC_VECTOR (31 downto 0);
			addr_out : out STD_LOGIC_VECTOR (11 downto 0)
	);
end entity;

architecture behavioral of simm_mux is
begin
	-- 8 MB
--	addr_out (9 downto 0) <=	addr_in (9 + 3 downto 3) when mux_select = '0' else
--								addr_in (9 + 10 + 3 downto 10 + 3);
--	addr_out (11 downto 10) <= (others => '0');
	-- 32 MB
	addr_out (10 downto 0) <=	addr_in (10 + 2 downto 2) when mux_select = '0' else
								addr_in (10 + 11 + 2 downto 11 + 2);
	addr_out (11) <= '0';
end architecture;
