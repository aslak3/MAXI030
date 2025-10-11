module led_register
    (
        input reset,
        input clock,

        input write,
        input cs,
        input [31:0] data_in,
        
        output reg led
    );

    always @ (posedge clock) begin
        if (reset) begin
            led <= 1'b0;
        end else begin
            if (cs && write) begin
                led <= data_in[24];
            end
        end
    end

endmodule
