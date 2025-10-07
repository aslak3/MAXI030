module test_register
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
