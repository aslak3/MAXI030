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

        output reg  [`DEVICE_SELECTED_MAXPOS-1:0] device_selected,
        output reg  [`PORT_WIDTH_WIDTH-1:0] port_width
    );

    always @ (*) begin
        if (function_normal_selected == 1'b1) begin
            if (vector_fetched == 1'b0) begin
                port_width = `PORT_WIDTH_WORD;
                device_selected = 1 << `DEVICE_ROM_POS;
            end else begin
                if (addr_upper[7:6] == 2'b00) begin
                    // port_width = `PORT_WIDTH_LONG;
                    // device_selected = (1 << `DEVICE_SIMM;
                    port_width = `PORT_WIDTH_WORD;
                    device_selected = 1 << `DEVICE_SLOT0_POS;
                end else if (addr_upper[7:6] == 2'b01) begin
                    port_width = `PORT_WIDTH_BYTE;
                    case (addr_upper[5:0])
                        6'b000000:  device_selected = 1 << `DEVICE_REGISTER8_POS; // 0x40
                        6'b010000:  device_selected = 1 << `DEVICE_QUART_POS; // 0x50
                        default:    device_selected = `DEVICE_NULL;
                    endcase
                end else if (addr_upper[7:6] == 2'b10) begin
                    port_width = `PORT_WIDTH_WORD;
                    case (addr_upper[5:0])
                        6'b000000:  device_selected = 1 << `DEVICE_REGISTER16_POS; // 0x80                    
                        6'b010000:  device_selected = 1 << `DEVICE_SLOT0_POS; // 0x90
                        6'b010001:  device_selected = 1 << `DEVICE_SLOT1_POS; // 0x91
                        6'b010010:  device_selected = 1 << `DEVICE_SLOT2_POS; // 0x92
                        6'b010011:  device_selected = 1 << `DEVICE_SLOT3_POS; // 0x93
                        6'b010100:  device_selected = 1 << `DEVICE_IDE1_POS;  // 0x94
                        6'b010101:  device_selected = 1 << `DEVICE_IDE3_POS;  // 0x95
                        6'b010110:  device_selected = 1 << `DEVICE_ETH_POS;   // 0x96
                        6'b111111:  device_selected = 1 << `DEVICE_ROM_POS;   // 0xbf
                        default:    device_selected =`DEVICE_NULL;
                    endcase
                end else if (addr_upper[7:6] == 2'b11) begin
                    port_width = `PORT_WIDTH_LONG;
                    case (addr_upper[5:0])
                        6'b000000:  device_selected = 1 << `DEVICE_REGISTER32_POS; // 0xc0
                        6'b010000:  device_selected = 1 << `DEVICE_SIMM_POS; // 0xd0
                        default:    device_selected = `DEVICE_NULL;
                    endcase
                end else begin
                    port_width = `PORT_WIDTH_NULL;
                    device_selected = `DEVICE_NULL;
                end
            end
        end else begin
            port_width = `PORT_WIDTH_NULL;
            device_selected = `DEVICE_NULL;
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
                8'h00:      register16_selected = 1 << `REGISTER16_TEST_POS;
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
                8'h00:      register32_selected = 1 << `REGISTER32_TEST_POS;
                default:    register32_selected = `REGISTER32_NULL;
            endcase
        end else begin
            register32_selected = `REGISTER32_NULL;
        end
    end
endmodule