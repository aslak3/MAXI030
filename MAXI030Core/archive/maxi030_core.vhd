library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package P_CORE is
	type T_ADDR_NAMES is (
		DEV_FPU,
	
		DEV_MAJ_SIMM,
		DEV_MAJ_SLOT0,
		DEV_MAJ_SLOT1,
		DEV_MAJ_SLOT2,
		DEV_MAJ_SLOT3,
		DEV_MAJ_ROM,

		DEV_MIN_QUART,
		DEV_MIN_IDE1,
		DEV_MIN_IDE3,
		DEV_MIN_ETH,

		REG_LED,
		REG_BUZZER,
		REG_SYS_CONF,
		REG_PS2A_STATUS,
		REG_PS2A_SCANCODE,
		REG_PS2B_STATUS,
		REG_PS2B_SCANCODE,
		REG_I2C_ADDRESS,
		REG_I2C_WRITE_DATA,
		REG_I2C_READ_DATA,
		REG_I2C_CONTROL,
		REG_RTC_INT_CONTROL,
		REG_SPI,
		REG_TIMER_COUNTU,
		REG_TIMER_COUNTM,
		REG_TIMER_COUNTL,
		REG_TIMER_CONTROL,
		REG_INT_PASS,
		REG_UART_DATA,
		REG_UART_STATUS
	);
	type T_ADDR_SELECTS is array (T_ADDR_NAMES) of STD_LOGIC;	

	type T_ADDR_WIDTHS is (
		WIDTH_NULL,
		WIDTH_BYTE,
		WIDTH_WORD,
		WIDTH_LONG
	);
	
	type T_CYCLE_TYPES is (
		CYCLE_NULL,
		CYCLE_BOOT_VECTORS,
		CYCLE_FPU,
		CYCLE_INT_ACK,
		CYCLE_REG,
		CYCLE_NORMAL
	);
end package;

-- Vector mapper for boot

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vector_mapper is
	port (	clock : in STD_LOGIC;
			as : in STD_LOGIC;
			vector_fetched : out STD_LOGIC;
			reset : in STD_LOGIC);
end entity;

architecture behavioral of vector_mapper is
	signal last_as : STD_LOGIC := '0';
	signal shifter : STD_LOGIC_VECTOR (4 downto 0) := "00000";
begin
	process (reset, clock)
	begin
		if (reset = '1') then
			shifter <= "00000";
		elsif (clock'event and clock = '1') then
			if (as = '1' and last_as = '0') then
				shifter <= shifter (3 downto 0) & '1';
			end if;
			last_as <= as;
		end if;
	end process;

	vector_fetched <= shifter (4);
end architecture;

-- Address decoding (major, minor, and register)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.P_CORE.ALL;

entity addr_decode is
	port (	clock : in STD_LOGIC;
			cycle_type : in T_CYCLE_TYPES;
			addr_high : in STD_LOGIC_VECTOR (31 downto 24);
			addr_mid : in STD_LOGIC_VECTOR (19 downto 16);
			addr_low : in STD_LOGIC_VECTOR (7 downto 0);
			selects : out T_ADDR_SELECTS;
			addr_width : out T_ADDR_WIDTHS;
			core_register : out STD_LOGIC;
			berr : out STD_LOGIC);
end entity;

architecture behavioral of addr_decode is
begin
	process (clock)
	begin
		if (clock'event and clock = '1') then
			selects <= (others => '0');
			addr_width <= WIDTH_NULL;
			core_register <= '0';
			berr <= '0';
			
			if (cycle_type = CYCLE_BOOT_VECTORS) then
				selects (DEV_MAJ_ROM) <= '1'; addr_width <= WIDTH_WORD;
			elsif (cycle_type = CYCLE_FPU) then
				selects (DEV_FPU) <= '1';
			elsif (cycle_type = CYCLE_REG) then
				core_register <= '1'; addr_width <= WIDTH_BYTE;
				if (addr_low = x"00")		then selects (REG_LED) <= '1';
				elsif (addr_low = x"01")	then selects (REG_BUZZER) <= '1';
				elsif (addr_low = x"02")	then selects (REG_SYS_CONF) <= '1';
				elsif (addr_low = x"03")	then selects (REG_PS2A_STATUS) <= '1';
				elsif (addr_low = x"04")	then selects (REG_PS2A_SCANCODE) <= '1';
				elsif (addr_low = x"05")	then selects (REG_PS2B_STATUS) <= '1';
				elsif (addr_low = x"06")	then selects (REG_PS2B_SCANCODE) <= '1';
				elsif (addr_low = x"07") 	then selects (REG_I2C_ADDRESS) <= '1';
				elsif (addr_low = x"08") 	then selects (REG_I2C_WRITE_DATA) <= '1';
				elsif (addr_low = x"09")	then selects (REG_I2C_READ_DATA) <= '1';
				elsif (addr_low = x"0a")	then selects (REG_I2C_CONTROL) <= '1';
				elsif (addr_low = x"0b")	then selects (REG_RTC_INT_CONTROL) <= '1';
				elsif (addr_low = x"0c")	then selects (REG_SPI) <= '1';
				elsif (addr_low = x"0d")	then selects (REG_TIMER_COUNTU) <= '1';
				elsif (addr_low = x"0e")	then selects (REG_TIMER_COUNTM) <= '1';
				elsif (addr_low = x"0f")	then selects (REG_TIMER_COUNTL) <= '1';
				elsif (addr_low = x"10")	then selects (REG_TIMER_CONTROL) <= '1';
				elsif (addr_low = x"11" )	then selects (REG_INT_PASS) <= '1';
				elsif (addr_low = x"12" )	then selects (REG_UART_DATA) <= '1';
				elsif (addr_low = x"13" )	then selects (REG_UART_STATUS) <= '1';
				else
					berr <= '1'; addr_width <= WIDTH_NULL;
				end if;
			elsif (cycle_type = CYCLE_NORMAL) then
				if (addr_high (31 downto 30) = "00")
													then selects (DEV_MAJ_SIMM) <= '1'; addr_width <= WIDTH_LONG;
				elsif (addr_high = x"40")			then selects (DEV_MAJ_SLOT0) <= '1'; addr_width <= WIDTH_WORD;
				elsif (addr_high = x"41")			then selects (DEV_MAJ_SLOT1) <= '1'; addr_width <= WIDTH_WORD;
				elsif (addr_high = x"42")			then selects (DEV_MAJ_SLOT2) <= '1'; addr_width <= WIDTH_WORD;
				elsif (addr_high = x"43")			then selects (DEV_MAJ_SLOT3) <= '1'; addr_width <= WIDTH_WORD;
				elsif (addr_high = x"44")			then
					if (addr_mid = x"1")			then selects (DEV_MIN_QUART) <= '1'; addr_width <= WIDTH_BYTE;
					elsif (addr_mid = x"2")			then selects (DEV_MIN_IDE1) <= '1'; addr_width <= WIDTH_WORD;
					elsif (addr_mid = x"3")			then selects (DEV_MIN_IDE3) <= '1'; addr_width <= WIDTH_WORD;
					elsif (addr_mid = x"4")			then selects (DEV_MIN_ETH) <= '1'; addr_width <= WIDTH_WORD;
					else
						berr <= '1'; addr_width <= WIDTH_NULL;
					end if;
				elsif (addr_high = x"ff")			then selects (DEV_MAJ_ROM) <= '1'; addr_width <= WIDTH_WORD;
				else
					berr <= '1'; addr_width <= WIDTH_NULL;
				end if;
			elsif (cycle_type = CYCLE_INT_ACK) then
				-- nothing to do
			else
				berr <= '1'; addr_width <= WIDTH_NULL;
			end if;
		end if;
	end process;
end architecture;

-- dtack generator

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity waitstate_gen is
	generic ( delay : in INTEGER);
	port (	clock : in STD_LOGIC;
			cs : in STD_LOGIC;
			waitstate : out STD_LOGIC);
end entity;

architecture behavioral of waitstate_gen is
	signal counter : INTEGER RANGE 0 to delay := 0;
begin
	process (clock)
	begin
		if (clock'event and clock = '0') then
			if (cs = '0') then
				counter <= 0;
			elsif (counter /= delay) then
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	waitstate <= '0' when (counter = delay) else '1';
end architecture;

-- Buzzer entity

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.P_CORE.ALL;

entity buzzer_action is
	port  (	clock : in STD_LOGIC;
			period : in STD_LOGIC_VECTOR (7 downto 0);
			buzzer : out STD_LOGIC);
end entity;

architecture behavioral of buzzer_action is
	signal counter : STD_LOGIC_VECTOR (17 downto 0) := (others => '0');
	signal buzzer_state : STD_LOGIC;
begin
	process (clock)
	begin
		if (clock'event and clock = '1') then
			if (period = counter (17 downto 10)) then
				buzzer_state <= not buzzer_state;
				counter <= (others => '0');
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	buzzer <= buzzer_state when period /= x"00" else '0';
end architecture;
	
-- External entity

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.P_CORE.ALL;
 
entity maxi030_core is
	port (	clock : in STD_LOGIC;

			n_berr : out STD_LOGIC;
			n_reset : in STD_LOGIC;
			n_halt : inout STD_LOGIC;
			p_reset : out STD_LOGIC;
			
			data : inout STD_LOGIC_VECTOR (31 downto 0);
			rn_w : in STD_LOGIC;
			addr : in STD_LOGIC_VECTOR (31 downto 0);
			n_as : in STD_LOGIC;
			n_ds : in STD_LOGIC;
			siz : in STD_LOGIC_VECTOR (1 downto 0);
			fc : in STD_LOGIC_VECTOR (2 downto 0);
			n_dsack : out STD_LOGIC_VECTOR (1 downto 0);
			n_rmc : in STD_LOGIC;
			n_sterm : out STD_LOGIC;
			
			n_br : out STD_LOGIC;
			n_bg : in STD_LOGIC;
			n_bgack : out STD_LOGIC;
			
			n_ciin : out STD_LOGIC;
			n_cbreq : in STD_LOGIC;
			n_cback : out STD_LOGIC;
			
			n_read : out STD_LOGIC;
			n_write : out STD_LOGIC;
			
			n_urom : out STD_LOGIC;
			n_lrom : out STD_LOGIC;
						
			n_ipend : in STD_LOGIC;
			n_ipl : out STD_LOGIC_VECTOR (2 downto 0);
			n_avec : out STD_LOGIC;
						
			n_simm : out STD_LOGIC;
			n_ras0 : out STD_LOGIC_VECTOR (3 downto 0);
			n_ras1 : out STD_LOGIC_VECTOR (3 downto 0);
			n_cas : out STD_LOGIC_VECTOR (3 downto 0);
			n_simm_we : out STD_LOGIC;
			simm_addr : out STD_LOGIC_VECTOR (11 downto 0);
			
			n_ucse : out STD_LOGIC_VECTOR (3 downto 0);
			n_lcse : out STD_LOGIC_VECTOR (3 downto 0);
			n_uexp : out STD_LOGIC;
			n_lexp : out STD_LOGIC;
			n_berre : in STD_LOGIC;
			n_waite : in STD_LOGIC;
			n_iacke : out STD_LOGIC_VECTOR (3 downto 0);
			n_inte : in STD_LOGIC_VECTOR (3 downto 0);

			n_quart : out STD_LOGIC;
			n_quart_irq : in STD_LOGIC;
			n_quart_iack : out STD_LOGIC;
			n_quart_dtack : in STD_LOGIC;

			n_ide : out STD_LOGIC;
			n_ide_irq : in STD_LOGIC;
			n_ide1 : out STD_LOGIC;
			n_ide3 : out STD_LOGIC;
			n_ide_ready : in STD_LOGIC;
			n_ide_dma_ack : out STD_LOGIC;
			n_ide_dma_req : in STD_LOGIC;
			n_ide_read : out STD_LOGIC;
			n_ide_write : out STD_LOGIC;
			
			n_eth : out STD_LOGIC;
			n_eth_int : in STD_LOGIC;
			
			scl : inout STD_LOGIC;
			sda : inout STD_LOGIC;
			rtc_square : in STD_LOGIC;
			temp_alert : in STD_LOGIC;
			
			ps2a_clock : inout STD_LOGIC;
			ps2a_data : inout STD_LOGIC;
			ps2b_clock : inout STD_LOGIC;
			ps2b_data : inout STD_LOGIC;
			
			led : out STD_LOGIC;
			buzzer : out STD_LOGIC;
			
			n_fpu_sense : in STD_LOGIC;
			n_fpu : out STD_LOGIC;
			
			user : inout STD_LOGIC_VECTOR (4 downto 0);
						
			sys_clear : out STD_LOGIC);
end entity;

architecture behavioral of maxi030_core is
	-- Address aliases
	alias addr_high : STD_LOGIC_VECTOR (31 downto 24) is addr (31 downto 24);
	alias addr_mid : STD_LOGIC_VECTOR (19 downto 16) is addr (19 downto 16);
	alias addr_low : STD_LOGIC_VECTOR (7 downto 0) is addr (7 downto 0);
	
	-- Address decoding
	signal addr_selects : T_ADDR_SELECTS;
	signal addr_width : T_ADDR_WIDTHS;
	signal core_register : STD_LOGIC := '0';
	signal cycle_type : T_CYCLE_TYPES;

	-- Addressable (write-only) registers
	signal writeable_rom : STD_LOGIC := '0';
	signal led_state : STD_LOGIC := '0';
	signal buzzer_period : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	
	-- Inputs mapped to positive logic
	signal reset : STD_LOGIC := '0';
	signal halt : STD_LOGIC := '0';
	signal as : STD_LOGIC;
	signal ds : STD_LOGIC;
	signal fpu_sense : STD_LOGIC;
	signal waite : STD_LOGIC := '0';
	
	-- Aliases for enables
	alias a0 : STD_LOGIC is addr (0);
	alias a1 : STD_LOGIC is addr (1);
	alias siz0 : STD_LOGIC is siz (0);
	alias siz1 : STD_LOGIC is siz (1);
	-- 16 bit enables
	signal lower : STD_LOGIC;
	signal upper : STD_LOGIC;
	-- 32 bit enables
	signal upper_upper : STD_LOGIC;
	signal upper_mid : STD_LOGIC;
	signal lower_mid : STD_LOGIC;
	signal lower_lower : STD_LOGIC;

	-- Outputs mapped to positive logic
	signal read : STD_LOGIC;
	signal write : STD_LOGIC;
	signal rom : STD_LOGIC;
	signal berr : STD_LOGIC;

	-- SIMM state
	signal simm_we : STD_LOGIC := '0';
	signal simm_ras : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	signal simm_cas : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	signal simm_waitstate : STD_LOGIC := '0';
	signal simm_mux_select : STD_LOGIC := '0';

	-- General state
	signal vector_fetched : STD_LOGIC;		
	signal core_led_state : STD_LOGIC;
	signal sys_clear_count : STD_LOGIC_VECTOR (24 downto 0) := (others => '0');
	signal int_cycle : STD_LOGIC := '0';
	signal rom_waitstate : STD_LOGIC := '0';
	signal quart_waitstate : STD_LOGIC := '0';
	signal eth_waitstate : STD_LOGIC := '0';
	signal ide1_waitstate : STD_LOGIC := '0';
	signal ide3_waitstate : STD_LOGIC := '0';

	-- PS/2 (a)
	signal ps2a_rx_scancode_byte : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	signal ps2a_scancode_ready : STD_LOGIC := '0';
	signal ps2a_scancode_ready_set : STD_LOGIC := '0';
	signal ps2a_parity_error : STD_LOGIC := '0';
	signal ps2a_int_enabled : STD_LOGIC := '0';

	signal ps2a_fifo_rdreq : STD_LOGIC := '0';
	signal ps2a_fifo_empty : STD_LOGIC := '0';
	signal ps2a_fifo_q : STD_LOGIC_VECTOR (7 downto 0);
	signal ps2a_fifo_usedw : STD_LOGIC_VECTOR (3 downto 0);		

	signal ps2a_tx_command_byte : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	signal ps2a_tx_command_trigger : STD_LOGIC := '0';
	signal ps2a_tx_clock : STD_LOGIC := '0';
	signal ps2a_tx_data : STD_LOGIC := '0';
	signal ps2a_tx_clock_driven : STD_LOGIC := '0';
	signal ps2a_tx_data_driven : STD_LOGIC := '0';
	signal ps2a_tx_ready : STD_LOGIC := '0';
	signal ps2a_edge_found : STD_LOGIC := '0';

	-- PS/2 (b)
	signal ps2b_rx_scancode_byte : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	signal ps2b_scancode_ready : STD_LOGIC := '0';
	signal ps2b_scancode_ready_set : STD_LOGIC := '0';
	signal ps2b_parity_error : STD_LOGIC := '0';
	signal ps2b_int_enabled : STD_LOGIC := '0';

	signal ps2b_fifo_rdreq : STD_LOGIC := '0';
	signal ps2b_fifo_empty : STD_LOGIC := '0';
	signal ps2b_fifo_q : STD_LOGIC_VECTOR (7 downto 0);
	signal ps2b_fifo_usedw : STD_LOGIC_VECTOR (3 downto 0);		
	
	signal ps2b_tx_command_byte : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	signal ps2b_tx_command_trigger : STD_LOGIC := '0';
	signal ps2b_tx_clock : STD_LOGIC := '0';
	signal ps2b_tx_data : STD_LOGIC := '0';
	signal ps2b_tx_clock_driven : STD_LOGIC := '0';
	signal ps2b_tx_data_driven : STD_LOGIC := '0';
	signal ps2b_tx_ready : STD_LOGIC := '0';
	signal ps2b_edge_found : STD_LOGIC := '0';

	-- i2c
	signal i2c_address : STD_LOGIC_VECTOR (6 downto 0);
	signal i2c_read_data : STD_LOGIC_VECTOR (7 downto 0);
	signal i2c_write_data : STD_LOGIC_VECTOR (7 downto 0);
	signal i2c_trigger : STD_LOGIC := '0';
	signal i2c_restart : STD_LOGIC := '0';
	signal i2c_read_write : STD_LOGIC := '0';
	signal i2c_last_byte : STD_LOGIC := '0';
	signal i2c_ack_error : STD_LOGIC := '0';
	signal i2c_busy : STD_LOGIC := '0';
	
	-- timer
	signal timer_start_value : STD_LOGIC_VECTOR (23 downto 0) := (others => '0');
	signal timer_start_trigger : STD_LOGIC := '0';
	signal timer_stop_trigger : STD_LOGIC := '0';
	signal timer_rollover : STD_LOGIC := '0';	

	-- data outputs
	signal core_register_data : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	signal int_vector_data : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	
	-- interrupts pass registers
	signal timer_int_pass : STD_LOGIC := '0';
	signal quart_int_pass : STD_LOGIC := '0';
	signal ide_int_pass : STD_LOGIC := '0';
	signal ps2_int_pass : STD_LOGIC := '0';
	-- Interrupt state
	signal eth_int_pass : STD_LOGIC := '0';
	signal timer_int : STD_LOGIC := '0';
	signal quart_int : STD_LOGIC := '0';
	signal ide_int : STD_LOGIC := '0';
	signal eth_int : STD_LOGIC := '0';
	signal ps2_int : STD_LOGIC := '0';
	signal rtc_int : STD_LOGIC := '0';
	
	signal slot0_waitstate : STD_LOGIC := '0';

	-- SPI FOR DEBUGGING
--	signal spi_trigger : STD_LOGIC := '0';
--	signal spi_data : STD_LOGIC_VECTOR (7 downto 0);

	-- UART TEST BED
--	signal uart_trigger : STD_LOGIC := '0';
--	signal uart_read_data : STD_LOGIC_VECTOR (7 downto 0);
--	signal uart_write_data : STD_LOGIC_VECTOR (7 downto 0);
--	signal uart_framing_error_set : STD_LOGIC := '0';
--	signal uart_tx_ready : STD_LOGIC := '0';
--	signal uart_rx_ready_set : STD_LOGIC := '0';
--	signal uart_rx_ready : STD_LOGIC := '0';
--	signal uart_framing_error : STD_LOGIC := '0';
begin		
	-- Copy inputs to positive versions
	reset <= not n_reset;
	as <= not n_as;
	ds <= not n_ds;
	fpu_sense <= not n_fpu_sense;

	-- Selects for 16 bit ports (writes)
	upper <= '1'		when (
						(a0 = '0') or								-- Upper byte, word aligned, any size
						rn_w = '1') else '0';
	lower <= '1'		when (
						(a0 = '1' or siz0 = '0' or siz1 = '1') or	-- Lower byte, odd aligned or word or long or 3 bytes
						rn_w = '1') else '0';
	
	-- Selects for 32 bit ports (writes)
	upper_upper <= '1' 	when (
						(a0 = '0' and a1 = '0') or					-- Upper byte, directly addressed, any size
						rn_w = '1') else '0';
	upper_mid <= '1' when (
						(a0 = '1' and a1 = '0') or					-- Upper mid, directly addressed, any size
						(a1 = '0' and siz0 = '0') or				-- Word aligned, size = 1 or 3 bytes
						(a1 = '0' and siz1 = '1') or				-- Word aligned, size = word or longword
						rn_w = '1') else '0';
	lower_mid <= '1' when (
						(a0 = '0' and a1 = '1') or					-- Lower mid, directly addressed, any size
						(a1 = '0' and siz0 = '0' and siz1 = '0') or	-- Word aligned, size = longword
						(a1 = '0' and siz0 = '1' and siz1 = '1') or	-- Word aligned, size = 3 bytes
						(a1 = '0' and a0 = '1' and siz0 = '0') or	-- word aligned, size = word or longword
						rn_w = '1') else '0';
	lower_lower <= '1' when (
						(a0 = '1' and a1 = '1') or					-- Lower byte directly addressed, any size
						(a0 = '1' and siz0 = '1' and siz1 = '1') or	-- Odd aligned, size = 3 bytes
						(siz0 = '0' and siz1 = '0') or				-- Any address, size = longword
						(a1 = '1' and siz1 = '1') or				-- Word aligned, size = word or 3 bytes
						rn_w = '1') else '0';
		
	vector_mapper: work.vector_mapper port map (
		clock => clock,
		as => as,
		vector_fetched => vector_fetched,
		reset => reset
	);

	cycle_type <=
		CYCLE_NULL when (as = '0') else
		CYCLE_BOOT_VECTORS when (vector_fetched = '0') else
		CYCLE_FPU when (fc = "111" and addr_mid = x"2" and fpu_sense = '1') else
		CYCLE_INT_ACK when (fc = "111" and addr_mid = x"f") else
		CYCLE_REG when (addr_high = x"44" and addr_mid = x"0") else
		CYCLE_NORMAL;
	
	addr_decode: work.addr_decode port map (
		clock => clock,
		cycle_type => cycle_type,
		addr_high => addr_high,
		addr_mid => addr_mid,
		addr_low => addr_low,
		selects => addr_selects,
		addr_width => addr_width,
		core_register => core_register,
		berr => berr
	);

	buzzer_action: work.buzzer_action port map (
		clock => clock,
		period => buzzer_period,
		buzzer => buzzer
	);
	
	timer: work.timer port map (
		clock => clock,
		reset => reset,
		start_trigger => timer_start_trigger,
		stop_trigger => timer_stop_trigger,
		start_value => timer_start_value,
		rollover => timer_rollover
	);
	
	read <=		'1' when (ds = '1' and rn_w = '1') else
				'0';
	write <=	'0' when (addr_selects (DEV_MAJ_ROM) = '1' and writeable_rom = '0') else
				'1' when (ds = '1' and rn_w = '0') else			
				'0';
				
	-- Local register read and write action
	process (clock)
	begin
		if (clock'event and clock = '1') then
			if (ps2a_scancode_ready_set = '1') then
				ps2a_scancode_ready <= '1';
			end if;
			if (ps2b_scancode_ready_set = '1') then
				ps2b_scancode_ready <= '1';
			end if;
--			if (uart_rx_ready_set = '1') then
--				uart_rx_ready <= '1';
--			end if;
--			if (uart_framing_error_set = '1') then
--				uart_framing_error <= '1';
--			end if;
			
			ps2a_tx_command_trigger <= '0';
			ps2b_tx_command_trigger <= '0';	
			i2c_trigger <= '0';
			i2c_restart <= '0';
			-- SPI DEBUG
--			spi_trigger <= '0';
			timer_start_trigger <= '0';
			timer_stop_trigger <= '0';
--			uart_trigger <= '0';
			
			if (write = '1') then			
				if (addr_selects (REG_SYS_CONF) = '1') then
					writeable_rom <= data (24);
				elsif (addr_selects (REG_LED) = '1') then
					led_state <= data (24);
				elsif (addr_selects (REG_BUZZER) = '1') then
					buzzer_period <= data (31 downto 24);
				elsif (addr_selects (REG_PS2A_STATUS) = '1') then
					ps2a_int_enabled <= data (24);
				elsif (addr_selects (REG_PS2A_SCANCODE) = '1') then
					ps2a_tx_command_byte <= data (31 downto 24);
					ps2a_tx_command_trigger <= '1';
				elsif (addr_selects (REG_PS2B_STATUS) = '1') then
					ps2b_int_enabled <= data (24);
				elsif (addr_selects (REG_PS2B_SCANCODE) = '1') then
					ps2b_tx_command_byte <= data (31 downto 24);
					ps2b_tx_command_trigger <= '1';
				elsif (addr_selects (REG_I2C_ADDRESS) = '1') then
					i2c_address <= data (30 downto 24);
					i2c_read_write <= data (31);
					i2c_trigger <= '1';
					i2c_restart <= '1';
				elsif (addr_selects (REG_I2C_READ_DATA) = '1') then
					i2c_trigger <= '1';
				elsif (addr_selects (REG_I2C_WRITE_DATA) = '1') then
					i2c_write_data <= data (31 downto 24);
					i2c_trigger <= '1';
				elsif (addr_selects (REG_I2C_CONTROL) = '1') then
					i2c_last_byte <= data (24);
				elsif (addr_selects (REG_RTC_INT_CONTROL) = '1') then
					rtc_int <= '0';
--				elsif (addr_selects (REG_SPI) = '1') then
--					spi_trigger <= '1';
--					spi_data <= data (31 downto 24);
				elsif (addr_selects (REG_TIMER_COUNTU) = '1') then
					timer_start_value (23 downto 16) <= data (31 downto 24);
				elsif (addr_selects (REG_TIMER_COUNTM) = '1') then
					timer_start_value (15 downto 8) <= data (31 downto 24);
				elsif (addr_selects (REG_TIMER_COUNTL) = '1') then
					timer_start_value (7 downto 0) <= data (31 downto 24);
				elsif (addr_selects (REG_TIMER_CONTROL) = '1') then
					timer_start_trigger <= data (24);
					timer_stop_trigger <= data (25);
				elsif (addr_selects (REG_INT_PASS) = '1') then
					timer_int_pass <= data (24);
					quart_int_pass <= data (25);
					ide_int_pass <= data (26);
					eth_int_pass <= data (27);
					ps2_int_pass <= data (28);
--				elsif (addr_selects (REG_UART_DATA) = '1') then
--					uart_trigger <= '1';
--					uart_write_data <= data (31 downto 24);
				end if;
			end if;
			
			ps2a_fifo_rdreq <= '0';
			ps2b_fifo_rdreq <= '0';
			if (read = '1') then
				if (addr_selects (REG_PS2A_SCANCODE) = '1') then
					ps2a_fifo_rdreq <= '1';
				elsif (addr_selects (REG_PS2B_SCANCODE) = '1') then
					ps2b_fifo_rdreq <= '1';
--				elsif (addr_selects (REG_UART_DATA) = '1') then
--					uart_rx_ready <= '0';
--					uart_framing_error <= '0';
				end if;
			end if;
		end if;
	end process;
	
	-- Read selector for databus (only 8 bits used currently)
	data (23 downto 0) <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";
	data (31 downto 24) <= "ZZZZZZZZ"			when (read = '0') else
			core_register_data 					when (core_register = '1') else
			int_vector_data						when (cycle_type = CYCLE_INT_ACK) else
			"ZZZZZZZZ";
	
	int_vector_data <=
			x"00";
	
	core_register_data <=
			"0000000" & led_state 				when (addr_selects (REG_LED) = '1') else
			buzzer_period 						when (addr_selects (REG_BUZZER) = '1') else
			"000000" & fpu_sense & writeable_rom
												when (addr_selects (REG_SYS_CONF) = '1') else
			ps2a_fifo_usedw & "0" & ps2a_tx_ready & ps2a_parity_error & not ps2a_fifo_empty
												when (addr_selects (REG_PS2A_STATUS) = '1') else											
			ps2a_fifo_q							when (addr_selects (REG_PS2A_SCANCODE) = '1') else
			ps2b_fifo_usedw & "0" & ps2b_tx_ready & ps2b_parity_error & not ps2b_fifo_empty
												when (addr_selects (REG_PS2B_STATUS) = '1') else											
			ps2b_fifo_q							when (addr_selects (REG_PS2B_SCANCODE) = '1') else
			i2c_read_data 						when (addr_selects (REG_I2C_READ_DATA) = '1') else
			"000000" & i2c_ack_error & i2c_busy	when (addr_selects (REG_I2C_CONTROL) = '1') else
			"000" & ps2_int_pass & eth_int_pass & ide_int_pass & quart_int_pass & timer_int_pass
												when (addr_selects (REG_INT_PASS) = '1') else
--			uart_read_data						when (addr_selects (REG_UART_DATA) = '1') else
--			"00000" & uart_tx_ready & uart_framing_error & uart_rx_ready 
--												when (addr_selects (REG_UART_STATUS) = '1') else
			x"00";

	-- SIMM controller
	simm_controller: work.simm_controller port map (
		reset => reset,
		clock => clock,
		simm => addr_selects (DEV_MAJ_SIMM),
		as => as,
		ds => ds,
		rn_w => rn_w,
		bank_addr => addr (10 + 11 + 3),
		byte_selects => upper_upper & upper_mid & lower_mid & lower_lower,
		write => simm_we,
		ras => simm_ras,
		cas => simm_cas,
		waitstate => simm_waitstate,
		mux_select => simm_mux_select
	);
	simm_mux: work.simm_mux port map (
		mux_select => simm_mux_select,
		addr_in => addr,
		addr_out => simm_addr
	);
	n_simm_we <= not simm_we;
	n_simm <= not addr_selects (DEV_MAJ_SIMM);
	n_ras0 <= not simm_ras;
	n_ras1 <= "1111";
	n_cas <= not simm_cas;

	-- PS/2 controller (a)
	ps2a_edge_finder: work.ps2_edge_finder port map(
		clock => clock,
		edge_found => ps2a_edge_found,
		ps2_clock => ps2a_clock
	);
	ps2a_rx_shifter: work.ps2_rx_shifter port map(
		clock => clock,
		edge_found => ps2a_edge_found,
		rx_scancode => ps2a_rx_scancode_byte,
		scancode_ready_set => ps2a_scancode_ready_set,
		parity_error => ps2a_parity_error,
		ps2_data => ps2a_data,
		tx_ready => ps2a_tx_ready
	);
	ps2a_fifo: work.ps2_fifo port map (
		clock => clock,
		data => ps2a_rx_scancode_byte,
		rdreq => ps2a_fifo_rdreq,
		wrreq => ps2a_scancode_ready_set,
		empty => ps2a_fifo_empty,
		q => ps2a_fifo_q,
		usedw => ps2a_fifo_usedw
	);
	ps2a_tx_shifter: work.ps2_tx_shifter port map(
		clock => clock,
		reset => reset,
		edge_found => ps2a_edge_found,
		tx_command_byte => ps2a_tx_command_byte,
		tx_command_trigger => ps2a_tx_command_trigger,
		tx_clock_driven => ps2a_tx_clock_driven,
		tx_data_driven => ps2a_tx_data_driven,
		ps2_clock => ps2a_tx_clock, 
		ps2_data => ps2a_tx_data,
		tx_ready => ps2a_tx_ready
	);
	ps2a_clock <= ps2a_tx_clock when ps2a_tx_clock_driven = '1' else 'Z';
	ps2a_data <= ps2a_tx_data when ps2a_tx_data_driven = '1' else 'Z';
		
	-- PS/2 controller (b)
	ps2b_edge_finder: work.ps2_edge_finder port map(
		clock => clock,
		edge_found => ps2b_edge_found,
		ps2_clock => ps2b_clock
	);
	ps2b_rx_shifter: work.ps2_rx_shifter port map(
		clock => clock,
		edge_found => ps2b_edge_found,
		rx_scancode => ps2b_rx_scancode_byte,
		scancode_ready_set => ps2b_scancode_ready_set,
		parity_error => ps2b_parity_error,
		ps2_data => ps2b_data,
		tx_ready => ps2b_tx_ready
	);
	ps2b_fifo: work.ps2_fifo port map (
		clock => clock,
		data => ps2b_rx_scancode_byte,
		rdreq => ps2b_fifo_rdreq,
		wrreq => ps2b_scancode_ready_set,
		empty => ps2b_fifo_empty,
		q => ps2b_fifo_q,
		usedw => ps2b_fifo_usedw
	);
	ps2b_tx_shifter: work.ps2_tx_shifter port map(
		clock => clock,
		reset => reset,
		edge_found => ps2b_edge_found,
		tx_command_byte => ps2b_tx_command_byte,
		tx_command_trigger => ps2b_tx_command_trigger,
		tx_clock_driven => ps2b_tx_clock_driven,
		tx_data_driven => ps2b_tx_data_driven,
		ps2_clock => ps2b_tx_clock,
		ps2_data => ps2b_tx_data,
		tx_ready => ps2b_tx_ready
	);
	ps2b_clock <= ps2b_tx_clock when ps2b_tx_clock_driven = '1' else 'Z';
	ps2b_data <= ps2b_tx_data when ps2b_tx_data_driven = '1' else 'Z';

	i2c_controller: work.i2c_controller port map (
		clock => clock,
		reset => reset,
		trigger => i2c_trigger,
		restart => i2c_restart,
		last_byte => i2c_last_byte,
		address => i2c_address,
		read_write => i2c_read_write,
		write_data => i2c_write_data,
		read_data => i2c_read_data,
		ack_error => i2c_ack_error,
		busy => i2c_busy,
		scl => scl,
		sda => sda
	);	

--	FOR DEBUG
--	spi_controller: work.spi_controller port map (
--		CLOCK => clock,
--		TRIGGER => spi_trigger,
--		OUT_BYTE => spi_data,
--		SCLK => user (0),
--		MOSI => user (1)
--	);

	-- UART TEST BED
--	uart: work.uart port map (
--		clock => clock,
--		reset => reset,
--		trigger => uart_trigger,
--		write_data => uart_write_data,
--		read_data => uart_read_data,
--		framing_error_set => uart_framing_error_set,
--		tx_ready => uart_tx_ready,
--		rx_ready_set => uart_rx_ready_set,
--		tx => user (0),
--		rx => user (1)
--	);

	-- Interrupt state
	int_cycle <= '1' when (cycle_type = CYCLE_INT_ACK) else '0';
	
	-- OUTPUTS
	
	-- General
	n_write <= not write;
	n_read <= not read;
	n_berr <= '1';--not berr;
	p_reset <= reset;
	n_quart_iack <= '1';

	-- ROM chip selects
	n_urom <= '0' when (addr_selects (DEV_MAJ_ROM) = '1' and upper = '1') else '1';
	n_lrom <= '0' when (addr_selects (DEV_MAJ_ROM) = '1' and lower = '1') else '1';

	-- Peripheral selects
	n_quart <= not addr_selects (DEV_MIN_QUART);
	n_ide1 <= not addr_selects (DEV_MIN_IDE1);
	n_ide3 <= not addr_selects (DEV_MIN_IDE3);
	n_eth <= not addr_selects (DEV_MIN_ETH);
	n_fpu <= not addr_selects (DEV_FPU);
	
	n_ide_read <= not read;
	n_ide_write <= not write;
	n_ide_dma_ack <= '1';
	
	-- Expansion
	n_ucse (0) <= '0' when (addr_selects (DEV_MAJ_SLOT0) = '1' and upper = '1') else '1';
	n_ucse (1) <= '0' when (addr_selects (DEV_MAJ_SLOT1) = '1' and upper = '1') else '1';
	n_ucse (2) <= '0' when (addr_selects (DEV_MAJ_SLOT2) = '1' and upper = '1') else '1';
	n_ucse (3) <= '0' when (addr_selects (DEV_MAJ_SLOT3) = '1' and upper = '1') else '1';
	n_lcse (0) <= '0' when (addr_selects (DEV_MAJ_SLOT0) = '1' and lower = '1') else '1';
	n_lcse (1) <= '0' when (addr_selects (DEV_MAJ_SLOT1) = '1' and lower = '1') else '1';
	n_lcse (2) <= '0' when (addr_selects (DEV_MAJ_SLOT2) = '1' and lower = '1') else '1';
	n_lcse (3) <= '0' when (addr_selects (DEV_MAJ_SLOT3) = '1' and lower = '1') else '1';
	
	n_uexp <= '0' when (upper = '1' and ds = '1' and (
						addr_selects (DEV_MAJ_SLOT0) = '1' or
						addr_selects (DEV_MAJ_SLOT1) = '1' or
						addr_selects (DEV_MAJ_SLOT2) = '1' or
						addr_selects (DEV_MAJ_SLOT3) = '1')
						) else '1';
	n_lexp <= '0' when (lower = '1' and ds = '1' and (
						addr_selects (DEV_MAJ_SLOT0) = '1' or
						addr_selects (DEV_MAJ_SLOT1) = '1' or
						addr_selects (DEV_MAJ_SLOT2) = '1' or
						addr_selects (DEV_MAJ_SLOT3) = '1')
						) else '1';

	flash_waitstate_gen: work.waitstate_gen generic map ( delay => 1 ) port map (
		clock => clock,
		cs => addr_selects (DEV_MAJ_ROM),
		waitstate => rom_waitstate
	);
	quart_waitstate_gen: work.waitstate_gen generic map ( delay => 1 ) port map (
		clock => clock,
		cs => addr_selects (DEV_MIN_QUART),
		waitstate => quart_waitstate
	);
	eth_waitstate_gen: work.waitstate_gen generic map ( delay => 1 ) port map (
		clock => clock,
		cs => addr_selects (DEV_MIN_ETH),
		waitstate => eth_waitstate
	);
	ide1_waitstate_gen: work.waitstate_gen generic map ( delay => 1 ) port map (
		clock => clock,
		cs => addr_selects (DEV_MIN_IDE1),
		waitstate => ide1_waitstate
	);
	ide3_waitstate_gen: work.waitstate_gen generic map ( delay => 1 ) port map (
		clock => clock,
		cs => addr_selects (DEV_MIN_IDE3),
		waitstate => ide3_waitstate
	);
--	slot0_waitstate_gen: work.waitstate_gen generic map ( delay => 2 ) port map (
--		clock => clock,
--		cs => addr_selects (DEV_MAJ_SLOT0),
--		waitstate => slot0_waitstate
--	);
	
	waite <= '1' when (n_waite = '0' and (
		addr_selects (DEV_MAJ_SLOT0) = '1' or
		addr_selects (DEV_MAJ_SLOT1) = '1' or
		addr_selects (DEV_MAJ_SLOT2) = '1' or
		addr_selects (DEV_MAJ_SLOT3) = '1'
	)) else '0';
	
	-- DSACK
	n_dsack <=	--"11" when (waite = '1') else
				"ZZ" when (addr_selects (DEV_FPU) = '1') else
--				"11" when (addr_selects (DEV_MAJ_SLOT0) = '1' and slot0_waitstate = '1') else
				"11" when (addr_selects (DEV_MAJ_SIMM) = '1' and simm_waitstate = '1') else
				"11" when (addr_selects (DEV_MAJ_ROM) = '1' and rom_waitstate = '1') else
				"11" when (addr_selects (DEV_MIN_QUART) = '1' and quart_waitstate = '1') else
				"11" when (addr_selects (DEV_MIN_ETH) = '1' and eth_waitstate = '1') else
				"11" when (addr_selects (DEV_MIN_IDE1) = '1' and ide1_waitstate = '1') else
				"11" when (addr_selects (DEV_MIN_IDE3) = '1' and ide3_waitstate = '1') else
				"00" when (addr_width = WIDTH_LONG) else
				"01" when (addr_width = WIDTH_WORD) else
				"10" when (addr_width = WIDTH_BYTE) else
				"11";

	n_halt <= '1';
	n_sterm <= '1';
	
	-- IDE stuff
	n_ide <= '0' when (addr_selects (DEV_MIN_IDE1) = '1' or addr_selects (DEV_MIN_IDE3) = '1') else '1'; --'0' when (as = '1' and addr_high = x"84" and (addr_mid = x"2" or addr_mid = x"3")) else '1';
	
	process (clock)
	begin
		if (clock'event and clock = '1') then
			if (((ps2a_fifo_empty = '0' and ps2a_int_enabled = '1') or
				(ps2b_fifo_empty = '0' and ps2b_int_enabled = '1')) and
				ps2_int_pass = '1') then
				n_ipl <= "010"; n_avec <= '0';
			elsif (n_eth_int = '1' and eth_int_pass = '1') then
				n_ipl <= "011"; n_avec <= '0';
			elsif (n_quart_irq = '0' and quart_int_pass = '1') then
				n_ipl <= "101"; n_avec <= '0';
			elsif (timer_rollover = '1' and timer_int_pass = '1') then
				n_ipl <= "110"; n_avec <= '0';
			else
				n_ipl <= "111"; n_avec <= '1';
			end if;
		end if;
	end process;
	
	n_cback <= '1';
	-- cache enable only on the SIMM and flash
	n_ciin <= '1' when (addr_selects (DEV_MAJ_SIMM) = '1' or addr_selects (DEV_MAJ_ROM) = '1') else '0';
	n_br <= '1';
	n_bgack <= '1';
	
	process (clock)
	begin
		if (clock'event and clock = '1') then
			if (sys_clear_count /= x"fffff") then
				sys_clear_count <= sys_clear_count + '1';
			end if;
		end if;	
	end process;
		
	-- Will get fed back into n_reset via O/C external logic
	sys_clear <= not sys_clear_count (19);

	led <= led_state;
	
	user <= "000" & timer_rollover & timer_int_pass;
end architecture;
