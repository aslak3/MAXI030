module test_register16
    (
        input reset,
        input clock,

        input write,
        input cs,
        input [31:0] data_in,
        
        output reg [15:0] data_out
    );

    reg test_data[31:0];

    always @ (posedge clock) begin
        if (reset) begin
        end else begin
            if (cs && write) begin
                data_out <= data_in[31:16];
            end
        end
    end
endmodule

module test_register32
    (
        input reset,
        input clock,

        input write,
        input cs,
        input [31:0] data_in,
        
        output reg [31:0] data_out
    );

    reg test_data[31:0];

    always @ (posedge clock) begin
        if (reset) begin
        end else begin
            if (cs && write) begin
                data_out <= data_in;
            end
        end
    end
endmodule
