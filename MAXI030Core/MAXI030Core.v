module MAXI030Core
	(
		input clock,

		output n_berr,
		input n_reset,
		output n_halt,
		output p_reset,
		
		inout [31:0] data,
		input rn_w,
		input [31:0] addr,
		input n_as,
		input n_ds,
		input [1:0] siz,
		input [2:0] fc,
		output [1:0] n_dsack,
		input n_rmc,
		output n_sterm,
		
		output n_br,
		input n_bg,
		output n_bgack,
		
		output n_ciin,
		input n_cbreq,
		output n_cback,
		
		output n_read,
		output n_write,
		
		output n_urom,
		output n_lrom,
					
		input n_ipend,
		output [2:0] n_ipl,
		output n_avec,
					
		output n_simm,
		output [3:0] n_ras0,
		output [3:0] n_ras1,
		output [3:0] n_cas,
		output n_simm_we,
		output [11:0] simm_addr,
		
		output [3:0] n_ucse,
		output [3:0] n_lcse,
		output n_uexp,
		output n_lexp,
		input n_berre,
		input n_waite,
		output [3:0] n_iacke,
		input [3:0] n_inte,

		output n_quart,
		input n_quart_irq,
		output n_quart_iack,
		input n_quart_dtack,

		output n_ide,
		input n_ide_irq,
		output n_ide1,
		output n_ide3,
		input n_ide_ready,
		output n_ide_dma_ack,
		input n_ide_dma_req,
		output n_ide_read,
		output n_ide_write,
		
		output n_eth,
		input n_eth_int,
		
		output scl,
		output sda,
		input rtc_square,
		input temp_alert,
		
		output ps2a_clock,
		output ps2a_data,
		output ps2b_clock,
		output ps2b_data,
		
		output led,
		output buzzer,
		
		input n_fpu_sense,
		output n_fpu,
		
		inout [4:0] user,

		output sys_clear
	);

	led_flasher led_flasher (
		.clock(clock),
		.reset(reset),
		.led(led)
	);
endmodule