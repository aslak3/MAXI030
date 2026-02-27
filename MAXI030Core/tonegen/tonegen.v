module tonegen
    (
        input reset,
        input clock,

        input [15:0] duration,
        input [15:0] period,
        input tone_start,
        output reg buzzer,
        output playing
    );

    reg [15+16:0] duration_counter = 32'h0;
    reg [15+2:0] period_counter = 18'h0;

    always @ (posedge clock) begin
        if (reset) begin
            duration_counter <= 32'h0;
            period_counter <= 18'h0;
            buzzer <= 1'b0;
        end else begin
            if (tone_start) begin
                period_counter <= { period, 2'b00 };
                duration_counter <= { duration, 16'h0000 };
            end

            if (duration_counter != 32'h0) begin
                if (period_counter == 18'h0) begin
                    buzzer <= ~buzzer;
                    period_counter <= { period, 2'b00 };
                end else begin
                    period_counter <= period_counter - 18'h1;
                end

                duration_counter <= duration_counter - 32'h1;
            end else begin
                buzzer <= 1'b0;
            end
        end
    end

    assign playing = duration_counter == 32'h0 ? 1'b0 : 1'b1;
endmodule
