module led_flasher
    (
        input clock,
        input reset,
        output led
    );

    reg [23:0] counter;

    always @ (posedge clock) begin
        if (reset) begin
            counter <= 20'b0;
        end else begin
            counter <= counter + 20'b1;
        end
    end

    assign led = counter[23];
endmodule
