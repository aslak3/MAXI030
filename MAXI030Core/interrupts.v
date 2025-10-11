/* verilator lint_off MULTITOP */

`include "interrupts.vh"

module ints_enabled_register
    (
        input reset,
        input clock,

        input write,
        input cs,
        input [31:0] data_in,

        output reg [7:0] ints_enabled
    );

    always @ (posedge clock) begin
        if (reset) begin
        end else begin
            if (cs && write) begin
                ints_enabled <= data_in [31:24];
            end
        end
    end
endmodule

module int_priority_encoder
    (
        input ps2_irq,
        input eth_irq,
        input ide_irq,
        input quart_irq,
        input timer_irq,
        input [7:0] ints_enabled,
    
        output [2:0] ipl,
        output avec
    );

    assign { ipl, avec } =  ps2_irq & ints_enabled[`PS2_INT_POS] ?      { 3'b101, 1'b1 } :
                            eth_irq & ints_enabled[`ETH_INT_POS] ?      { 3'b100, 1'b1 } :
                            ide_irq & ints_enabled[`IDE_INT_POS] ?      { 3'b100, 1'b1 } :
                            quart_irq & ints_enabled[`QUART_INT_POS] ?  { 3'b010, 1'b1 } :
                            timer_irq & ints_enabled[`TIMER_INT_POS] ?  { 3'b001, 1'b1 } :
                                                                        { 3'b000, 1'b0 };
endmodule
