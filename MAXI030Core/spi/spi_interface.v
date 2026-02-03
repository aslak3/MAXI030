/* verilator lint_off MULTITOP */

module spi_interface
    (
        input           reset,
        input           clock,

        input           write,

        input           data_in_cs,
        input [31:0]    data_in,

        output          sclk,
        output          mosi,

        output          running
    );

    reg         trigger;
    reg [7:0]   data;

    always @ (posedge clock) begin
        if (reset) begin
            data <= 8'h0;
            trigger <= 1'b0;
        end else begin
            trigger <= 1'b0;
            if (write) begin
                if (data_in_cs) begin
                    data <= data_in[31:24];
                    trigger <= 1'b1;
                end
            end
        end
    end

    spi spi (
        .reset(reset),
        .clock(clock),

        .trigger(trigger),
        .out_byte(data),

        .sclk(sclk),
        .mosi(mosi),

        .running(running)
    );

endmodule
