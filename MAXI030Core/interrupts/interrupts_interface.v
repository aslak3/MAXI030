/* verilator lint_off MULTITOP */

`include "interrupts/interrupts.vh"

module interrupts_interface
    (
        input       reset,
        input       clock,

        input       read,
        input       write,
        input       cs,
        input       [15:0] data_in,
        output reg  [15:0] data_out,
        output      data_out_valid,

        input       [`INT_MAXPOS-1:0] irqs_active,
        output      [2:0] ipl,
        output      avec
    );

    reg [`INT_MAXPOS-1:0] ints_enabled = { `INT_MAXPOS { 1'b0 } };

    always @ (*) begin
        if (cs) begin
            data_out = { { 16-`INT_MAXPOS {1'b0} }, ints_enabled };
        end else begin
            data_out = { 16'h0 };
        end
    end

    assign data_out_valid = read && cs ? 1'b1 : 1'b0;

    always @ (posedge clock) begin
        if (reset) begin
            ints_enabled <= { `INT_MAXPOS { 1'b0 } };
        end else begin
            if (write) begin
                if (cs) begin
                    ints_enabled <= data_in[`INT_MAXPOS-1:0];
                end
            end
        end
    end

    interrupts interrupts
    (
        .irqs_active(irqs_active),
        .ints_enabled(ints_enabled),
        .ipl(ipl),
        .avec(avec)
    );
endmodule
