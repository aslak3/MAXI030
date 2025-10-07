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
                {3'b111, 4'h2, 1'b1}:   function_selected = `FUNCTION_FPU;
                {3'b111, 4'hf, 1'b?}:   function_selected = `FUNCTION_INT_ACK;
                default:                function_selected = `FUNCTION_NORMAL;
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
                device_selected = `DEVICE_ROM;
            end else begin
                if (addr_upper[7:6] == 2'b00) begin
                    // port_width = `PORT_WIDTH_LONG;
                    // device_selected = `DEVICE_SIMM;
                    port_width = `PORT_WIDTH_WORD;
                    device_selected = `DEVICE_SLOT0;
                end else if (addr_upper[7:6] == 2'b01) begin
                    port_width = `PORT_WIDTH_WORD;
                    case (addr_upper[5:0])
                        6'b000000:          device_selected = `DEVICE_SLOT0; // 0x40
                        6'b000001:          device_selected = `DEVICE_SLOT1; // 0x41
                        6'b000010:          device_selected = `DEVICE_SLOT2; // 0x42
                        6'b000011:          device_selected = `DEVICE_SLOT3; // 0x43
                        6'b000100:          device_selected = `DEVICE_IDE1;  // 0x44
                        6'b000101:          device_selected = `DEVICE_IDE3;  // 0x45
                        6'b000110:          device_selected = `DEVICE_ETH;   // 0x46
                        6'b111111:          device_selected = `DEVICE_ROM;   // 0x7f
                        default:            device_selected = `DEVICE_NULL;
                    endcase
                end else if (addr_upper[7:6] == 2'b10) begin
                    port_width = `PORT_WIDTH_BYTE;
                    case (addr_upper[5:0])
                        6'b000000:          device_selected = `DEVICE_REGISTER8; // 0x80
                        6'b000001:          device_selected = `DEVICE_QUART; // 0x81
                        default:            device_selected = `DEVICE_NULL;
                    endcase
                end else if (addr_upper[7:6] == 2'b11) begin
                    port_width = `PORT_WIDTH_LONG;
                    case (addr_upper[5:0])
                        6'b000000:          device_selected = `DEVICE_REGISTER32; // 0xc0
                        default:            device_selected = `DEVICE_NULL;
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
                8'h00:      register8_selected = `REGISTER8_LED;
                default:    register8_selected = `REGISTER8_NULL;
            endcase
        end else begin
            register8_selected = `REGISTER8_NULL;
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
                8'h00:      register32_selected = `REGISTER32_TEST;
                default:    register32_selected = `REGISTER32_NULL;
            endcase
        end else begin
            register32_selected = `REGISTER32_NULL;
        end
    end
endmodule