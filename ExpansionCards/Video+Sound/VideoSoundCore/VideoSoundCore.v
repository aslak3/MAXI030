/* verilator lint_off UNOPTFLAT */

module VideoSoundCore
    (
        // Video address and data
        output      [19:0] va,
        inout       [15:0] vd,
        output      n_vread,
        output      n_vwrite,
        output      n_vlcs,
        output      n_vucs,

        // CPU interface
        input       [21:0] a,
        inout       [31:16] d,
        input       n_read,
        input       n_write,
        input       n_lcs,
        input       n_ucs,
        input       n_reset,
        output      n_wait,
        output      n_berr,
        output      n_int,

        //  LED
        output reg  user_led,

        // Video output
        output      dac_clock,
        output      n_vgablank,
        output reg  [7:0] red,
        output reg  [7:0] green,
        output reg  [7:0] blue,
        output      h_sync,
        output      v_sync,

        // I2S audio
        output      i2s_mute,
        output      [1:0] i2s_for,
        output      i2s_sync_clk_pll1,
        output      i2s_datai,
        output      i2s_ws,
        output      i2s_bclk,
        output      i2s_deem_clk_out,
        output      i2s_pll0,

        // Clocks
        input       mpu_clock,
        input       master_clock,
        input       video_clock,

        // User I/O
        inout      [3:0] userio
    );

    wire reset = ~n_reset;
    wire read = ~n_read;
    wire write = ~n_write;
    wire ucs = ~n_ucs;
    wire lcs = ~n_lcs;

    wire [15:0] data_out;
    wire data_out_valid;
    wire [15:0] sram_data_out;
    wire sram_data_out_valid;
    wire sram_controller_busy;

    reg read_s__, read_s_;
    reg write_s__, write_s_;
    // reg [21:0] addr_s__; reg [21:0] addr_s_;
    // reg ucs_s__, ucs_s_;
    // reg lcs_s__, lcs_s_;
    // reg [15:0] data_in_s__; reg [15:0] data_in_s_;

    // Stabilise (video_clock -> mpu_clock) through 2 FF.
    always @ (posedge video_clock) begin
        read_s__ <= read;
        write_s__ <= write;
        // addr_s__ <= a;
        // ucs_s__ <= ucs;
        // lcs_s__ <= lcs;
        // data_in_s__ <= d;

        read_s_ <= read_s__;
        write_s_ <= write_s__;
        // addr_s_ <= addr_s__;
        // ucs_s_ <= ucs_s__;
        // lcs_s_ <= lcs_s__;
        // data_in_s_ <= data_in_s__;
    end

    wire read_s = read_s_;
    wire write_s = write_s_;
    // wire [21:0] addr = addr_s_;
    // wire ucs_s = ucs_s_;
    // wire lcs_s = lcs_s_;
    // wire [15:0] data_in_s = data_in_s_;

    reg read_trigger, write_trigger;
    wire read_ack, write_ack;

    always @ (posedge video_clock) begin
        if (read_ack) begin
            read_trigger <= 1'b0;
        end else if (read_s && (ucs || lcs)) begin
            read_trigger <= 1'b1;
        end

        if (write_ack) begin
            write_trigger <= 1'b0;
        end else if (write_s && (ucs || lcs)) begin
            write_trigger <= 1'b1;
        end
    end

    reg fifo_read_trigger = 1'b0;
    reg [20:1] fifo_addr = 20'd0;
    reg [9:0] column_countdown = 10'd0;
    
    always @ (posedge video_clock) begin
        if (reset) begin
            column_countdown <= 10'd0;
            fifo_addr <= 20'd0;
        end else begin
            if (frame_start) begin
                column_countdown <= 10'd0;
                fifo_addr <= 20'd35;
            end
            if (line_start) begin
                column_countdown <= 10'd640;
                fifo_read_trigger <= 1'b1;
            end
            if (fifo_data_out_valid) begin
                if (column_countdown != 10'd0) begin
                    fifo_read_trigger <= 1'b1;
                    fifo_addr <= fifo_addr + 20'd1;
                    column_countdown <= column_countdown - 10'd1;
                end else begin
                    fifo_read_trigger <= 1'b0;
                end
            end
        end
    end
    
    reg [15:0] fifo_data_out;
    reg fifo_data_out_valid;
    
    sram_controller sram_controller
    (
        .reset(reset),
        .clock(video_clock),
        
        .fifo_addr(fifo_addr),
        .fifo_read_trigger(fifo_read_trigger),
        .fifo_data_out(fifo_data_out),
        .fifo_data_out_valid(fifo_data_out_valid),

        .cpu_addr(a[20:1]),
        .cpu_read_trigger(read_trigger),
        .cpu_write_trigger(write_trigger),
        .cpu_ucs(ucs),
        .cpu_lcs(lcs),
        .cpu_data_in(d),
        .cpu_data_out(data_out),
        .cpu_data_out_valid(data_out_valid),
        .cpu_read_ack(read_ack),
        .cpu_write_ack(write_ack),
        .cpu_busy(sram_controller_busy),

        .sram_addr(va),
        .sram_n_vread(n_vread),
        .sram_n_vwrite(n_vwrite),
        .sram_n_ucs(n_vucs),
        .sram_n_lcs(n_vlcs),
        .sram_data(vd)
    );

    reg [15:0] pixel_data;
    reg fifo_full, fifo_empty;
    dual_clock_fifo #(
        .DEPTH(1024),
        .WIDTH(16),
        .PTR_WIDTH(10)
    ) dual_clock_fifo (
        .wr_clk(video_clock),
        .wr_rst_n(n_reset),
        .wr_en(fifo_data_out_valid),
        .din(fifo_data_out),
        
        .rd_clk(dac_clock),
        .rd_rst_n(n_reset),
        .rd_en(h_visible & v_visible),
        .dout(pixel_data),
        
        .full(fifo_full),
        .empty(fifo_empty)
    );
    
    reg [1:0] video_clock_div;
    always @ (posedge video_clock) begin
        video_clock_div <= video_clock_div + 2'b01;
    end
    assign dac_clock = video_clock_div[1];
    assign n_vgablank = 1'b1;
    
    wire h_visible;
    wire v_visible;
    wire [9:0] h_count;
    wire [9:0] v_count;
    wire [9:0] frame_count;
    wire line_start;
    wire frame_start;
    video_sync video_sync
    (
        .clock(dac_clock),
        
        .h_sync(h_sync),
        .v_sync(v_sync),
        
        .h_visible(h_visible),
        .v_visible(v_visible),
        .h_count(h_count),
        .v_count(v_count),
        .frame_count(frame_count),
        
        .line_start(line_start),
        .frame_start(frame_start)
    );
    
    always @ (negedge video_clock) begin
        if (h_visible && v_visible) begin
            // red <= h_count[8:1];
            // green <= h_count[8:1];
            // blue <= h_count[8:1];
            // red <= pixel_data[15:8];
            // green <= pixel_data[15:8];
            // blue <= pixel_data[15:8];
            red <= { pixel_data[15:11], 3'd0 };
            green <= { pixel_data[10:5], 2'd0 };
            blue <= { pixel_data[4:0], 3'd0 };

        end else begin
            red <= 8'h00; green <= 8'h00; blue <= 8'h00;
        end
    end
    
    // Read out the SRAM data if we are selected and reading.
    assign d = read_s && (ucs || lcs) ? data_out : 16'hzzzz;

    // Pass through mapping
    // assign d = (ucs | lcs) & read ? vd : 16'hzzzz;
    // assign vd = (ucs | lcs) & write ? d : 16'hzzzz;
    // assign n_vwrite = n_write;
    // assign n_vread = n_read;
    // assign va = a[20:1];
    // assign n_vucs = n_ucs;
    // assign n_vlcs = n_lcs;
    // End passthrough

    assign n_wait = sram_controller_busy ? 1'b0 : 1'b1;
    assign n_berr = 1'b1;
    
    assign user_led = n_reset;
endmodule
