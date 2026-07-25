/* verilator lint_off MULTITOP */

module dmac_interface
    (
        input       reset,
        input       clock,

        input       read,
        input       write,
        input       src_addr_cs,
        input       dst_addr_cs,
        input       length_cs,
        input       control_cs,
        input       [31:0] data_in,
        output reg  [31:0] data_out,
        output      data_out_valid,

        output      br,
        input       bg,
        output      bgack,
        input       ext_as,
        output      [31:0] addr,
        output      rn_w,
        output      as,
        output      ds,
        output      [1:0] siz,
        output      [2:0] fc,
        input       [1:0] dsack,

        output      trace
    );

    reg [31:0] src_addr;
    reg [31:0] dst_addr;
    reg [15:0] length;
    reg trigger;
    reg src_io;
    reg dst_io;

    always @ (*) begin
        if (src_addr_cs) begin
            data_out = src_addr;
        end else if (dst_addr_cs) begin
            data_out = dst_addr;
        end else if (length_cs) begin
            data_out = { 16'h0, length };
        end else if (bgack && !rn_w && ds) begin
            data_out = dmac_data_out;
        end else begin
            data_out = 32'h0;
        end
    end

    assign data_out_valid =
        (read && (src_addr_cs || dst_addr_cs || length_cs || control_cs)) ||
        (bgack && !rn_w) ? 1'b1 : 1'b0;

    always @ (posedge clock) begin
        if (reset) begin
            src_addr <= 32'h0;
            dst_addr <= 32'h0;
            length <= 16'h0;
            trigger <= 1'b0;
            src_io <= 1'b0;
            dst_io <= 1'b0;
        end else begin
            trigger <= 1'b0;

            if (write) begin
                if (src_addr_cs) begin
                    src_addr <= data_in;
                end else if (dst_addr_cs) begin
                    dst_addr <= data_in;
                end else if (length_cs) begin
                    length <= data_in [15:0];
                end else if (control_cs) begin
                    trigger <= data_in[0];
                    src_io <= data_in[1];
                    dst_io <= data_in[2];
                end
            end
        end
    end

    wire [31:0] dmac_data_out;
    dmac dmac (
        .clock(clock),
        .reset(reset),

        .trigger(trigger),
        .src_io(src_io),
        .dst_io(dst_io),
        .src_addr(src_addr),
        .dst_addr(dst_addr),
        .length(length),

        .br(br),
        .bg(bg),
        .bgack(bgack),
        .ext_as(ext_as),
        .addr(addr),
        .rn_w(rn_w),
        .as(as),
        .ds(ds),
        .siz(siz),
        .fc(fc),
        .data_in(data_in),
        .data_out(dmac_data_out),
        .dsack(dsack),

        .trace(trace)
    );
endmodule
