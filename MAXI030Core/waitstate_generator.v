module waitstate_generator #(
        parameter DELAY = 4'h1
    )
    (
        input clock,
        input cs,

        output waitstate
    );

    reg [3:0] counter;

    always @ (posedge clock) begin
        if (~cs) begin
            counter <= 4'h0;
        end else if (counter != DELAY) begin
            counter <= counter + 4'h1;
        end
    end

    assign waitstate = counter == DELAY ? 1'b0 : cs;
endmodule
