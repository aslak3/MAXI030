/* verilator lint_off MULTITOP */

`include "interrupts/interrupts.vh"

module interrupts
    (
        input [`INT_MAXPOS-1:0] irqs_active,
        input [`INT_MAXPOS-1:0] ints_enabled,

        output [2:0] ipl,
        output avec
    );

    assign { ipl, avec } =
        irqs_active[`INT_PS2_POS] & ints_enabled[`INT_PS2_POS] ?        { 3'b101, 1'b1 } :
        irqs_active[`INT_ETH_POS] & ints_enabled[`INT_ETH_POS] ?        { 3'b100, 1'b1 } :
        irqs_active[`INT_IDE_POS] & ints_enabled[`INT_IDE_POS] ?        { 3'b011, 1'b1 } :
        irqs_active[`INT_QUART_POS] & ints_enabled[`INT_QUART_POS] ?    { 3'b010, 1'b1 } :
        irqs_active[`INT_TIMER_POS] & ints_enabled[`INT_TIMER_POS] ?    { 3'b001, 1'b1 } :
                                                                        { 3'b000, 1'b0 };
endmodule
