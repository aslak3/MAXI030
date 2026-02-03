/* verilator lint_off MULTITOP */

`include "addr_decode.vh"

module function_decode
    (
        input       as,
        input       [2:0] fc,
        input       [3:0] addr_middle,
        input       fpu_sense,

        output reg  [`FUNCTION_SELECTED_MAXPOS-1:0] function_selected
    );

    always @ (*) begin
        if (!as) begin
            function_selected = `FUNCTION_NULL;
        end else begin
             casez ({fc, addr_middle, fpu_sense})
                {3'b111, 4'h2, 1'b1}:   function_selected = 1 << `FUNCTION_FPU_POS;
                {3'b111, 4'hf, 1'b?}:   function_selected = 1 << `FUNCTION_INT_ACK_POS;
                default:                function_selected = 1 << `FUNCTION_NORMAL_POS;
            endcase
        end
    end
endmodule

module device_decode
    (
        input       function_normal_selected,
        input       vector_fetched,
        input       [7:0] addr_upper,
        input       [3:0] addr_middle,

        output reg  [`DEVICE_SELECTED_MAXPOS-1:0] device_selected,
        output reg  [`PORT_WIDTH_WIDTH-1:0] port_width
    );

    always @ (*) begin
        if (function_normal_selected == 1'b1) begin
            if (vector_fetched == 1'b0) begin
                port_width = `PORT_WIDTH_WORD; device_selected = 1 << `DEVICE_ROM_POS;
            end else begin
                if (addr_upper[7:6] == 2'b00) begin
                    // port_width = `PORT_WIDTH_WORD; device_selected = 1 << `DEVICE_SLOT0_POS;
                    port_width = `PORT_WIDTH_LONG; device_selected = 1 << `DEVICE_SIMM_POS;
                end else if (addr_upper == 8'h40) begin
                    port_width = `PORT_WIDTH_WORD;  device_selected = 1 << `DEVICE_SLOT0_POS;
                end else if (addr_upper == 8'h41) begin
                    port_width = `PORT_WIDTH_WORD;  device_selected = 1 << `DEVICE_SLOT1_POS;
                end else if (addr_upper == 8'h42) begin
                    port_width = `PORT_WIDTH_WORD;  device_selected = 1 << `DEVICE_SLOT2_POS;
                end else if (addr_upper == 8'h43) begin
                    port_width = `PORT_WIDTH_WORD;  device_selected = 1 << `DEVICE_SLOT3_POS;
                end else if (addr_upper == 8'h44) begin
                    if (addr_middle == 4'h0) begin
                        port_width = `PORT_WIDTH_BYTE;
                        device_selected = 1 << `DEVICE_REGISTER8_POS;
                    end else if (addr_middle == 4'h0) begin
                        port_width = `PORT_WIDTH_BYTE; device_selected = 1 << `DEVICE_REGISTER8_POS;
                    end else if (addr_middle == 4'h1) begin
                        port_width = `PORT_WIDTH_BYTE; device_selected = 1 << `DEVICE_QUART_POS;
                    end else if (addr_middle == 4'h2) begin
                        port_width = `PORT_WIDTH_WORD; device_selected = 1 << `DEVICE_IDE1_POS;
                    end else if (addr_middle == 4'h3) begin
                        port_width = `PORT_WIDTH_WORD; device_selected = 1 << `DEVICE_IDE3_POS;
                    end else if (addr_middle == 4'h4) begin
                        port_width = `PORT_WIDTH_WORD; device_selected = 1 << `DEVICE_ETH_POS;
                    end else begin
                        port_width = `PORT_WIDTH_NULL; device_selected = 1 << `DEVICE_NULL;
                    end
                end else if (addr_upper[7:6] == 2'b10) begin
                    port_width = `PORT_WIDTH_LONG; device_selected = 1 << `DEVICE_SIMM_POS;
                end else if (addr_upper == 8'hff) begin
                    port_width = `PORT_WIDTH_WORD; device_selected = 1 << `DEVICE_ROM_POS;
                end else begin
                    port_width = `PORT_WIDTH_NULL; device_selected = 1 << `DEVICE_NULL;
                end
            end
        end else begin
            port_width = `PORT_WIDTH_NULL; device_selected = `DEVICE_NULL;
        end
    end
endmodule

module register8_decode
    (
        input       device_register8_selected,
        input       [7:0] addr_lower,

        output reg  [`REGISTER8_SELECTED_MAXPOS-1:0] register8_selected
    );

    always @ (*) begin
        if (device_register8_selected) begin
            case (addr_lower)
                8'h00:      register8_selected = 1 << `REGISTER8_LED_POS;
                8'h01:      register8_selected = 1 << `REGISTER8_INTS_ENABLED_POS;
                8'h02:      register8_selected = 1 << `REGISTER8_TIMER_CONTROL_POS;
                8'h0c:      register8_selected = 1 << `REGISTER8_SPI_DATA_POS;
                default:    register8_selected = `REGISTER8_NULL;
            endcase
        end else begin
            register8_selected = `REGISTER8_NULL;
        end
    end
endmodule

module register16_decode
    (
        input       device_register16_selected,
        input       [7:0] addr_lower,

        output reg  [`REGISTER16_SELECTED_MAXPOS-1:0] register16_selected
    );

    always @ (*) begin
        if (device_register16_selected) begin
            case (addr_lower)
                default:    register16_selected = `REGISTER16_NULL;
            endcase
        end else begin
            register16_selected = `REGISTER16_NULL;
        end
    end
endmodule

module register32_decode
    (
        input       device_register32_selected,
        input       [7:0] addr_lower,

        output reg  [`REGISTER32_SELECTED_MAXPOS-1:0] register32_selected
    );

    always @ (*) begin
        if (device_register32_selected) begin
            case (addr_lower)
                8'h00:      register32_selected = 1 << `REGISTER32_TIMER_START_VALUE_POS;
                8'h04:      register32_selected = 1 << `REGISTER32_TIMER_CURRENT_VALUE_POS;
                default:    register32_selected = `REGISTER32_NULL;
            endcase
        end else begin
            register32_selected = `REGISTER32_NULL;
        end
    end
endmodule