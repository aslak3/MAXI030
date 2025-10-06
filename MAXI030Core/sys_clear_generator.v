module sys_clear_generator
    (
        input clock,

        output sys_clear
    );

    reg [19:0] counter = 20'h00000;

    always @ (posedge clock) begin
        if (counter != 20'hfffff) begin
            counter <= counter + 20'b1;
        end
    end

    assign sys_clear = ~counter[19];
endmodule
