`include "addr_decode.vh"
`include "interrupts/interrupts.vh"

module MAXI030Core
    (
        input       clock,
        input       n_reset,

        // Critical system signals
        output      n_berr,
        output      n_halt,
        output      p_reset,

        // Memory bus
        inout       [31:0] data,
        inout       rn_w,
        inout       [31:0] addr,
        inout       n_as,
        inout       n_ds,
        inout       [1:0] siz,
        inout       [2:0] fc,
        output      [1:0] n_dsack,
        // Not used by DMAC
        input       n_rmc,
        output      n_sterm,
        // Memory bus derived
        output      n_read,
        output      n_write,

        // Multi-master
        output      n_br,
        input       n_bg,
        output      n_bgack,

        // Cache
        output      n_ciin,
        input       n_cbreq,
        output      n_cback,

        // ROM Chip Select
        output      n_urom,
        output      n_lrom,

        // Interrupts
        input       n_ipend,
        output      [2:0] n_ipl,
        output      n_avec,

        // SIMM slots
        output      n_simm,
        output      [3:0] n_ras0,
        output      [3:0] n_ras1,
        output      [3:0] n_cas,
        output      n_simm_we,
        output      [11:0] simm_addr,

        // Expansion connectors
        output      [3:0] n_ucse,
        output      [3:0] n_lcse,
        output      n_uexp,
        output      n_lexp,
        input       n_berre,
        input       n_waite,
        output      [3:0] n_iacke,
        input       [3:0] n_inte,

        // QUART
        output      n_quart,
        input       n_quart_irq,
        output      n_quart_iack,
        input       n_quart_dtack,

        // IDE
        output      n_ide,
        input       ide_irq,
        output      n_ide1,
        output      n_ide3,
        input       n_ide_ready,
        output      n_ide_dma_ack,
        input       n_ide_dma_req,
        output      n_ide_read,
        output      n_ide_write,

        // Ethernet
        output      n_eth,
        input       eth_int,

        // I2C
        inout       scl,
        inout       sda,
        input       rtc_square,
        input       temp_alert,

        // PS/2 keyboard and mouse
        output      ps2a_clock,
        output      ps2a_data,
        output      ps2b_clock,
        output      ps2b_data,

        // Flashing and buzzing
        output      led,
        output      buzzer,

        // FPU
        input       n_fpu_sense,
        output      n_fpu,

        // For anything external
        inout       [4:0] user,

        // Board level reset generator; hooked to O/C gate to generate /RESET
        output      sys_clear
    );

    // Use positive logic
    wire reset = ~n_reset;
    wire as = ~n_as;
    wire ds = ~n_ds;
    wire fpu_sense = ~n_fpu_sense;

    // The internal memory bus
    wire local_rn_w = bgack ? dmac_rn_w : rn_w;
    assign rn_w = bgack ? dmac_rn_w : 1'bz;
    wire [31:0] local_addr = bgack ? dmac_addr : addr;
    assign addr = bgack ? dmac_addr : 32'hzzzzzzzz;
    wire local_as = bgack ? dmac_as : as;
    assign n_as = bgack ? ~dmac_as : 1'bz;
    wire local_ds = bgack ? dmac_ds : ~n_ds;
    assign n_ds = bgack ? ~dmac_ds : 1'bz;
    wire [1:0] local_siz = bgack ? dmac_siz : siz;
    assign siz = bgack ? dmac_siz : 2'bzz;
    wire [2:0] local_fc = bgack ? dmac_fc : fc;
    assign fc = bgack ? dmac_fc : 3'bzzz;
    wire [31:0] local_data_out = bgack & ~dmac_rn_w ? dmac_data_out : data;

    wire read = local_ds & local_rn_w;
    wire write = local_ds & ~local_rn_w;

    wire waite = ~n_waite;
    wire berre = ~n_berre;

    assign n_read = ~read;
    assign n_write = ~write;
    wire vector_fetched;
    vector_mapper vector_mapper
    (
        .reset(reset),
        .clock(clock),

        .as(local_as),
        .vector_fetched(vector_fetched)
    );

    wire upper, lower;
    wire upper_upper, upper_mid, lower_mid, lower_lower;
    byte_select_generator byte_select_generator
    (
        .a0(local_addr[0]), .a1(local_addr[1]),
        .rn_w(local_rn_w),
        .siz0(local_siz[0]), .siz1(local_siz[1]),

        .upper(upper), .lower(lower),
        .upper_upper(upper_upper), .upper_mid(upper_mid),
        .lower_mid(lower_mid), .lower_lower(lower_lower)
    );

    wire [`FUNCTION_SELECTED_MAXPOS-1:0] function_selected;
    function_decode function_decode
    (
        .as(local_as),
        .fc(local_fc),
        .addr_middle(local_addr[19:16]),
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
        .addr_upper(local_addr[31:24]),
        .addr_middle(local_addr[19:16]),
        .addr_upper_lower(local_addr[15:8]),

        .device_selected(device_selected),
        .port_width(port_width)
    );

    wire quart_waitstate;
    waitstate_generator #(
        .DELAY(4'h2)
    ) quart_waitstate_generator (
        .clock(clock),
        .cs(device_selected[`DEVICE_QUART_POS]),

        .waitstate(quart_waitstate)
    );

    wire rom_waitstate;
    waitstate_generator #(
        .DELAY(4'h1)
    ) rom_waitstate_generator (
        .clock(clock),
        .cs(device_selected[`DEVICE_ROM_POS]),

        .waitstate(rom_waitstate)
    );

    wire eth_waitstate;
    waitstate_generator #(
        .DELAY(4'h2)
    ) eth_waitstate_generator (
        .clock(clock),
        .cs(device_selected[`DEVICE_ETH_POS]),

        .waitstate(eth_waitstate)
    );

    // Device chip selects
    assign n_ide1 =     ~device_selected[`DEVICE_IDE1_POS];
    assign n_ide3 =     ~device_selected[`DEVICE_IDE3_POS];
    assign n_ide =      ~(device_selected[`DEVICE_IDE1_POS] | device_selected[`DEVICE_IDE3_POS]);
    assign n_eth =      ~device_selected[`DEVICE_ETH_POS];
    assign n_urom =     ~(device_selected[`DEVICE_ROM_POS] & upper);
    assign n_lrom =     ~(device_selected[`DEVICE_ROM_POS] & lower);
    assign n_quart =    ~device_selected[`DEVICE_QUART_POS];

    // DSACK
    wire [1:0] dsack =  waite && (
                            device_selected[`DEVICE_SLOT0_POS] || device_selected[`DEVICE_SLOT1_POS] ||
                            device_selected[`DEVICE_SLOT2_POS] || device_selected[`DEVICE_SLOT3_POS]
                        ) ? 2'b00 :
                        quart_waitstate ? 2'b00 :
                        rom_waitstate ? 2'b00 :
                        eth_waitstate ? 2'b00 :
                        simm_waitstate && device_selected[`DEVICE_SIMM_POS] ? 2'b00 :
                        port_width;

    assign n_dsack = function_selected[`FUNCTION_FPU_POS] ? 2'bzz : ~dsack;

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
    assign n_uexp = (~(
        device_selected[`DEVICE_SLOT0_POS] | device_selected[`DEVICE_SLOT1_POS] |
        device_selected[`DEVICE_SLOT2_POS] | device_selected[`DEVICE_SLOT3_POS]
    ));
    assign n_lexp = (~(
        device_selected[`DEVICE_SLOT0_POS] | device_selected[`DEVICE_SLOT1_POS] |
        device_selected[`DEVICE_SLOT2_POS] | device_selected[`DEVICE_SLOT3_POS]
    ));
    assign n_iacke[3:0] = 4'hf;

    // Cache inhibit: cache enable only on the SIMM and flash when FPGA isn't the master
    assign n_ciin = ~bgack & (device_selected[`DEVICE_SIMM_POS] | device_selected[`DEVICE_ROM_POS]);

    // Bus error occurs either when no device is selected, or a register bank is selected but no
    // registers
    assign n_berr = 1'b1;
        // (function_selected[`FUNCTION_NORMAL_POS] & device_selected == `DEVICE_NULL) |
        // (device_selected[`DEVICE_REGISTER8_POS] & register8_selected == `REGISTER8_NULL) |
        // (device_selected[`DEVICE_REGISTER16_POS] & register16_selected == `REGISTER16_NULL) |
        // (device_selected[`DEVICE_REGISTER32_POS] & register32_selected == `REGISTER32_NULL) |
        // (berre & (
        //     device_selected[`DEVICE_SLOT0_POS] | device_selected[`DEVICE_SLOT1_POS] |
        //     device_selected[`DEVICE_SLOT2_POS] | device_selected[`DEVICE_SLOT3_POS]
        // )
        // ) ? 1'b0 : 1'b1;

    wire [3:0] simm_ras0;
    wire [3:0] simm_ras1;
    wire [3:0] simm_cas;
    wire simm_waitstate;
    wire simm_mux_select;
    wire simm_write;
    simm_controller simm_controller
    (
        .reset(reset),
        .clock(clock),

        .cs(device_selected[`DEVICE_SIMM_POS]),
        .as(local_as),
        .ds(local_ds),
        .rn_w(local_rn_w),
        .bank_addr(local_addr[10 + 11 + 3]),
        .slot_addr(local_addr[10 + 11 + 3 + 1]),
        .byte_selects({ upper_upper, upper_mid, lower_mid, lower_lower }),

        .write(simm_write),
        .ras0(simm_ras0),
        .ras1(simm_ras1),
        .cas(simm_cas),
        .waitstate(simm_waitstate),
        .mux_select(simm_mux_select)
    );

    assign n_simm = ~device_selected[`DEVICE_SIMM_POS];
    assign n_ras0 = ~simm_ras0;
    assign n_ras1 = ~simm_ras1;
    assign n_cas = ~simm_cas;
    assign n_simm_we = ~simm_write;

    simm_mux simm_mux
    (
        .mux_select(simm_mux_select),
        .addr_in(local_addr),

        .addr_out(simm_addr)
    );

    // Placeholders
    // CPU
    assign n_halt = 1'b1;
    assign n_sterm = 1'b1;
    assign n_cback = 1'b1;
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
        .addr_lower_lower(local_addr[7:0]),

        .register8_selected(register8_selected)
    );

    wire [`REGISTER16_SELECTED_MAXPOS-1:0] register16_selected;
    register16_decode register16_decode
    (
        .device_register16_selected(device_selected[`DEVICE_REGISTER16_POS]),
        .addr_lower_lower(local_addr[7:0]),

        .register16_selected(register16_selected)
    );

    wire [`REGISTER32_SELECTED_MAXPOS-1:0] register32_selected;
    register32_decode register32_decode
    (
        .device_register32_selected(device_selected[`DEVICE_REGISTER32_POS]),
        .addr_lower_lower(local_addr[7:0]),

        .register32_selected(register32_selected)
    );

    wire [7:0] data8 =
        led_data_out_valid ? led_data_out :
        i2c_data_out_valid ? i2c_data_out :
        ps2a_data_out_valid ? ps2a_data_out :
        ps2b_data_out_valid ? ps2b_data_out :
        8'h00;

    wire [15:0] data16 =
        tonegen_data_out_valid ? tonegen_data_out :
        interrupt_data_out_valid ? interrupt_data_out :
        16'h0000;

    wire [31:0] data32 =
        timer_data_out_valid ? timer_data_out :
        32'h00000000;

    assign data =
        read & device_selected[`DEVICE_REGISTER8_POS] ?     { data8, 24'h000000 } :
        read & device_selected[`DEVICE_REGISTER16_POS] ?    { data16, 16'h0000 } :
        read & device_selected[`DEVICE_REGISTER32_POS] ?    data32 :
        read & device_selected[`DEVICE_BROM_POS] ?          brom_dout :
        dmac_data_out_valid ? dmac_data_out :
        32'hzzzzzzzz;

    wire [7:0] led_data_out;
    wire led_data_out_valid;
    led_interface led_interface
    (
        .reset(reset),
        .clock(clock),

        .read(read),
        .write(write),
        .cs(register8_selected[`REGISTER8_LED_POS]),
        .data_in(data[31:24]),
        .data_out(led_data_out),
        .data_out_valid(led_data_out_valid),

        .led(led)
    );
    
    wire [15:0] tonegen_data_out;
    wire tonegen_data_out_valid;
    tonegen_interface tonegen_interface
    (
        .reset(reset),
        .clock(clock),

        .read(read),
        .write(write),
        .duration_cs(register16_selected[`REGISTER16_TONEGEN_DURATION_POS]),
        .period_cs(register16_selected[`REGISTER16_TONEGEN_PERIOD_POS]),
        .status_cs(register16_selected[`REGISTER16_TONEGEN_STATUS_POS]),
        .data_in(data[31:16]),
        .data_out(tonegen_data_out),
        .data_out_valid(tonegen_data_out_valid),

        .buzzer(buzzer)
    );

    // spi_interface spi_interface
    // (
    //     .reset(reset),
    //     .clock(clock),

    //     .write(write),
    //     .cs(register8_selected[`REGISTER8_SPI_DATA_POS]),
    //     .data_in(data[31:24]),

    //     .sclk(user[0]),
    //     .mosi(user[1])
    // );

    wire [7:0] i2c_data_out;
    wire i2c_data_out_valid;
    i2c_interface i2c_interface
    (
        .reset(reset),
        .clock(clock),

        .read(read),
        .write(write),
        .address_cs(register8_selected[`REGISTER8_I2C_ADDRESS_POS]),
        .read_cs(register8_selected[`REGISTER8_I2C_READ_POS]),
        .write_cs(register8_selected[`REGISTER8_I2C_WRITE_POS]),
        .control_cs(register8_selected[`REGISTER8_I2C_CONTROL_POS]),
        .data_in(data[31:24]),
        .data_out(i2c_data_out),
        .data_out_valid(i2c_data_out_valid),

        .scl(scl),
        .sda(sda)
    );

    wire [7:0] ps2a_data_out;
    wire ps2a_data_out_valid;
    ps2_interface ps2a_interface
    (
        .clock(clock),

        .read(read),
        .status_cs(register8_selected[`REGISTER8_PS2A_STATUS_POS]),
        .scancode_cs(register8_selected[`REGISTER8_PS2A_SCANCODE_POS]),
        .data_out(ps2a_data_out),
        .data_out_valid(ps2a_data_out_valid),

        .ps2_clock(ps2a_clock),
        .ps2_data(ps2a_data)
    );
    wire [7:0] ps2b_data_out;
    wire ps2b_data_out_valid;
    ps2_interface ps2b_interface
    (
        .clock(clock),

        .read(read),
        .status_cs(register8_selected[`REGISTER8_PS2B_STATUS_POS]),
        .scancode_cs(register8_selected[`REGISTER8_PS2B_SCANCODE_POS]),
        .data_out(ps2b_data_out),
        .data_out_valid(ps2b_data_out_valid),

        .ps2_clock(ps2b_clock),
        .ps2_data(ps2b_data)
    );

    wire [15:0] interrupt_data_out;
    wire interrupt_data_out_valid;
    wire [`INT_MAXPOS-1:0] irqs_active;
    assign irqs_active[`INT_TIMER_POS] = timer_irq;
    assign irqs_active[`INT_QUART_POS] = ~n_quart_irq;
    assign irqs_active[`INT_IDE_POS] = ide_irq;
    assign irqs_active[`INT_ETH_POS] = eth_int;
    assign irqs_active[`INT_PS2_POS] = 1'b0;
    wire [2:0] ipl;
    assign n_ipl = ~ipl;
    wire avec;
    assign n_avec = ~avec;
    interrupts_interface interrupts_interface
    (
        .reset(reset),
        .clock(clock),

        .read(read),
        .write(write),
        .cs(register16_selected[`REGISTER16_INTS_ENABLED_POS]),
        .data_in(data[31:16]),
        .data_out(interrupt_data_out),
        .data_out_valid(interrupt_data_out_valid),

        .irqs_active(irqs_active),
        .ipl(ipl),
        .avec(avec)
    );

    wire [31:0] dmac_data_out;
    wire dmac_data_out_valid;
    wire br;
    assign n_br = ~br;
    wire bg;
    assign bg = ~n_bg;
    wire bgack;
    assign n_bgack = ~bgack;

    wire [31:0] dmac_addr;
    wire dmac_rn_w;
    wire dmac_as;
    wire dmac_ds;
    wire [1:0] dmac_siz;
    wire [2:0] dmac_fc;
    wire dmac_trace;
    dmac_interface dmac_interface
    (
        .reset(reset),
        .clock(clock),

        .read(read),
        .write(write),
        .src_addr_cs(register32_selected[`REGISTER32_DMAC_SRC_ADDR_POS]),
        .dst_addr_cs(register32_selected[`REGISTER32_DMAC_DST_ADDR_POS]),
        .length_cs(register32_selected[`REGISTER32_DMAC_LENGTH_POS]),
        .control_cs(register32_selected[`REGISTER32_DMAC_CONTROL_POS]),
        .data_in(data),
        .data_out(dmac_data_out),
        .data_out_valid(dmac_data_out_valid),

        .br(br),
        .bg(bg),
        .bgack(bgack),
        .ext_as(as),
        .addr(dmac_addr),
        .rn_w(dmac_rn_w),
        .as(dmac_as),
        .ds(dmac_ds),
        .siz(dmac_siz),
        .fc(dmac_fc),
        .dsack(dsack),

        .trace(dmac_trace)
    );

    wire [31:0] timer_data_out;
    wire timer_data_out_valid;
    wire timer_irq;
    timer_interface timer_interface
    (
        .reset(reset),
        .clock(clock),

        .read(read),
        .write(write),
        .start_value_cs(register32_selected[`REGISTER32_TIMER_START_VALUE_POS]),
        .current_value_cs(register32_selected[`REGISTER32_TIMER_CURRENT_VALUE_POS]),
        .control_cs(register32_selected[`REGISTER32_TIMER_CONTROL_POS]),
        .data_in(data),
        .data_out(timer_data_out),
        .data_out_valid(timer_data_out_valid),

        .irq(timer_irq)
    );

    wire [31:0] brom_dout;
    // brom brom
    // (
    //     .clock(clock),

    //     .addr(addr[10:2]),

    //     .dout(brom_dout)
    // );

    sys_clear_generator sys_clear_generator
    (
        .clock(clock),

        .sys_clear(sys_clear)
    );

    assign user[0] = bgack;
endmodule
