`include "addr_decode.vh"

module MAXI030Core
	(
		input	clock,
		input 	n_reset,

		// Critical system signals
		output 	n_berr,
		output 	n_halt,
		output 	p_reset,

		// Memory bus
		inout 	[31:0] data,
		input 	rn_w,
		input 	[31:0] addr,
		input	 n_as,
		input 	n_ds,
		input 	[1:0] siz,
		input 	[2:0] fc,
		output 	[1:0] n_dsack,
		input 	n_rmc,
		output 	n_sterm,
		output 	n_read,
		output 	n_write,

		// Multi-master
		output 	n_br,
		input 	n_bg,
		output 	n_bgack,

		// Cache
		output 	n_ciin,
		input 	n_cbreq,
		output 	n_cback,

		// ROM Chip Select
		output 	n_urom,
		output 	n_lrom,

		// Interrupts
		input 	n_ipend,
		output 	[2:0] n_ipl,
		output 	n_avec,

		// SIMM slot
		output 	n_simm,
		output 	[3:0] n_ras0,
		output 	[3:0] n_ras1,
		output 	[3:0] n_cas,
		output 	n_simm_we,
		output 	[11:0] simm_addr,

		// Expansion connectors
		output 	[3:0] n_ucse,
		output 	[3:0] n_lcse,
		output 	n_uexp,
		output 	n_lexp,
		input 	n_berre,
		input 	n_waite,
		output 	[3:0] n_iacke,
		input 	[3:0] n_inte,

		// QUART
		output 	n_quart,
		input 	n_quart_irq,
		output 	n_quart_iack,
		input 	n_quart_dtack,

		// IDE
		output 	n_ide,
		input 	n_ide_irq,
		output 	n_ide1,
		output 	n_ide3,
		input 	n_ide_ready,
		output 	n_ide_dma_ack,
		input 	n_ide_dma_req,
		output 	n_ide_read,
		output 	n_ide_write,

		// Ethernet
		output 	n_eth,
		input 	n_eth_int,

		// I2C
		output 	scl,
		output 	sda,
		input 	rtc_square,
		input 	temp_alert,

		// PS/2 keyboard and mouse
		output	ps2a_clock,
		output 	ps2a_data,
		output 	ps2b_clock,
		output 	ps2b_data,

		// Flashing and buzzing
		output 	led,
		output 	buzzer,

		// FPU
		input 	n_fpu_sense,
		output 	n_fpu,

		// For anything external
		inout 	[4:0] user,

		// Board level reset generator; hooked to O/C gate to generate /RESET
		output 	sys_clear
	);

	// Use positive logic
	wire reset = ~n_reset;
	wire as = ~n_as;
	wire ds = ~n_ds;
	wire fpu_sense = ~n_fpu_sense;

	wire read = ds & rn_w;
	wire write = ds & ~rn_w;

	assign n_read = ~read;
	assign n_write = ~write;
	wire vector_fetched;
	vector_mapper vector_mapper (
		.clock(clock),
		.reset(reset),

		.as(as),
		.vector_fetched(vector_fetched)
	);

	wire upper, lower;
	wire upper_upper, upper_mid, lower_mid, lower_lower;
	byte_select_generator byte_select_generator (
		.a0(addr[0]), .a1(addr[1]),
		.rn_w(rn_w),
		.siz0(siz[0]), .siz1(siz[1]),

		.upper(upper), .lower(lower),
		.upper_upper(upper_upper), .upper_mid(upper_mid),
		.lower_mid(lower_mid), .lower_lower(lower_lower)
	);

	wire [`FUNCTION_SELECTED_MAXPOS-1:0] function_selected;
	function_decode function_decode
    (
        .as(as),
        .fc(fc),
        .addr_middle(addr[19:16]),
        .fpu_sense(fpu_sense),

        .function_selected(function_selected)
    );

	assign n_fpu = ~function_selected[`FUNCTION_FPU_POS];

	wire [`DEVICE_SELECTED_MAXPOS-1:0] device_selected;
	wire [`PORT_WIDTH_WIDTH-1:0] port_width;
	device_decode device_decode
	(
		.function_normal_selected(function_selected[`FUNCTION_NORMAL_POS]),
		.vector_fetched(vector_fetched),
		.addr_upper(addr[31:24]),

		.device_selected(device_selected),
		.port_width(port_width)
	);

	wire quart_waitstate;
	waitstate_generator #(
		.DELAY(4'h2)
	) waitstate_generator (
		.clock(clock),
		.cs(device_selected[`DEVICE_QUART_POS]),

		.waitstate(quart_waitstate)
	);

	// Device chip selects
	assign n_ide1 = 	~device_selected[`DEVICE_IDE1_POS];
	assign n_ide3 = 	~device_selected[`DEVICE_IDE3_POS];
	assign n_ide =		~(device_selected[`DEVICE_IDE1_POS] | device_selected[`DEVICE_IDE3_POS]);
	assign n_eth = 		~device_selected[`DEVICE_ETH_POS];
	assign n_urom = 	~(device_selected[`DEVICE_ROM_POS] & upper);
	assign n_lrom = 	~(device_selected[`DEVICE_ROM_POS] & lower);
	assign n_quart = 	~device_selected[`DEVICE_QUART_POS];

	// DSACK
	assign n_dsack =    function_selected[`FUNCTION_FPU_POS] ? 2'bzz :
						quart_waitstate ? 2'b11 :
						port_width;

	// Misc
	assign p_reset = reset;

	// Expansion chip selects, upper and lower
	assign n_ucse[0] = ~(device_selected[`DEVICE_SLOT0_POS] & upper);
	assign n_ucse[1] = ~(device_selected[`DEVICE_SLOT1_POS] & upper);
	assign n_ucse[2] = ~(device_selected[`DEVICE_SLOT2_POS] & upper);
	assign n_ucse[3] = ~(device_selected[`DEVICE_SLOT3_POS] & upper);
	assign n_lcse[0] = ~(device_selected[`DEVICE_SLOT0_POS] & lower);
	assign n_lcse[1] = ~(device_selected[`DEVICE_SLOT1_POS] & lower);
	assign n_lcse[2] = ~(device_selected[`DEVICE_SLOT2_POS] & lower);
	assign n_lcse[3] = ~(device_selected[`DEVICE_SLOT3_POS] & lower);
	// Expansion bidirectional data buffer enables
	assign n_uexp = ~(upper & ds & (
		device_selected[`DEVICE_SLOT0_POS] | device_selected[`DEVICE_SLOT1_POS] |
		device_selected[`DEVICE_SLOT2_POS] | device_selected[`DEVICE_SLOT3_POS]
	));
	assign n_lexp = ~(lower & ds & (
		device_selected[`DEVICE_SLOT0_POS] | device_selected[`DEVICE_SLOT1_POS] |
		device_selected[`DEVICE_SLOT2_POS] | device_selected[`DEVICE_SLOT3_POS]
	));
	assign n_iacke[3:0] = 4'hf;

	// Cache inhibit: cache enable only on the SIMM and flash
	assign n_ciin = (device_selected[`DEVICE_SIMM_POS] | device_selected[`DEVICE_ROM_POS]);

	// Bus error occurs either when no device is selected, or a register bank is selected but no
	// registers
	assign n_berr = function_selected[`FUNCTION_NORMAL_POS] & (
		(device_selected == `DEVICE_NULL) |
		// TODO fix bootloader or implement buzzer, etc
		// (device_selected[`DEVICE_REGISTER8_POS] & register8_selected == `REGISTER8_NULL) |
		(device_selected[`DEVICE_REGISTER16_POS] & register16_selected == `REGISTER16_NULL) |
		(device_selected[`DEVICE_REGISTER32_POS] & register32_selected == `REGISTER32_NULL)
		) ? 1'b0 : 1'b1;

	// Placeholders
	// CPU
	assign n_halt = 1'b1;
	assign n_sterm = 1'b1;
	assign n_ipl = 3'b111;
	assign n_avec = 1'b1;
	assign n_cback = 1'b1;
	assign n_br = 1'b1;
	assign n_bgack = 1'b1;

	// SIMM
	assign n_ras0 = 4'hf;
	assign n_ras1 = 4'hf;
	assign n_cas[3:0] = 4'hf;
	assign n_simm = 1'b1;
	assign simm_addr = 12'h000;
	assign n_simm_we = 1'b1;
	// I2C
	assign scl = 1'b1;
	assign sda = 1'b1;
	// PS/2
	assign ps2a_clock = 1'b1;
	assign ps2a_data = 1'b1;
	assign ps2b_clock = 1'b1;
	assign ps2b_data = 1'b1;
	// QUART
	assign n_quart_iack = 1'b1;
	// IDE
	assign n_ide_dma_ack = 1'b1;
	assign n_ide_read = ~read;
	assign n_ide_write = ~write;

	wire [`REGISTER8_SELECTED_MAXPOS-1:0] register8_selected;
	register8_decode register8_decode
	(
		.device_register8_selected(device_selected[`DEVICE_REGISTER8_POS]),
		.addr_lower(addr[7:0]),

		.register8_selected(register8_selected)
	);

	wire [`REGISTER16_SELECTED_MAXPOS-1:0] register16_selected;
	register16_decode register16_decode
	(
		.device_register16_selected(device_selected[`DEVICE_REGISTER16_POS]),
		.addr_lower(addr[7:0]),

		.register16_selected(register16_selected)
	);

	wire [`REGISTER32_SELECTED_MAXPOS-1:0] register32_selected;
	register32_decode register32_decode
	(
		.device_register32_selected(device_selected[`DEVICE_REGISTER32_POS]),
		.addr_lower(addr[7:0]),

		.register32_selected(register32_selected)
	);

	wire [7:0] data8 =
		register8_selected[`REGISTER8_LED_POS] ? { 7'b0000000, led } :
		8'h00;

	wire [15:0] data16 =
		register16_selected[`REGISTER16_TEST_POS] ? test_data16_out :
		16'h0000;

	wire [31:0] data32 =
		register32_selected[`REGISTER32_TEST_POS] ? test_data32_out :
		32'h00000000;

	assign data =
		read & device_selected[`DEVICE_REGISTER8_POS] ? { data8, 24'h000000 } :
		read & device_selected[`DEVICE_REGISTER16_POS] ? { data16, 16'h0000 } :
		read & device_selected[`DEVICE_REGISTER32_POS] ? data32 :
		32'hzzzzzzzz;

	led_register led_register
    (
        .reset(reset),
        .clock(clock),

        .write(write),
        .cs(register8_selected[`REGISTER8_LED_POS]),
		.data_in(data[31:24]),

		.led(led)
    );

	wire [15:0] test_data16_out;
	test_register16 test_register16
    (
        .reset(reset),
        .clock(clock),

        .write(write),
        .cs(register16_selected[`REGISTER16_TEST_POS]),
		.data_in(data),

		.data_out(test_data16_out)
    );

	wire [31:0] test_data32_out;
	test_register32 test_register32
    (
        .reset(reset),
        .clock(clock),

        .write(write),
        .cs(register32_selected[`REGISTER32_TEST_POS]),
		.data_in(data),

		.data_out(test_data32_out)
    );

	sys_clear_generator sys_clear_generator
	(
		.clock(clock),

		.sys_clear(sys_clear)
	);

	assign user[4:0] = { 4'b00000, register8_selected[`REGISTER8_LED_POS] };
endmodule