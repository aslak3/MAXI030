module vector_mapper
    (
        input clock,
        input reset,

        input as,
        output vector_fetched
    );

    reg last_as;
    reg [4:0] shifter;

    always @ (posedge clock) begin
        if (reset == 1'b1) begin
            shifter <= 5'b00000; // Initialize shift register to 
            last_as <= 1'b1;
        end else begin
            if (as == 1'b0 && last_as == 1'b1) begin
                shifter <= { shifter[3:0], 1'b1 };
            end
            last_as <= as;
        end
    end

    assign vector_fetched = shifter[4];
endmodule
