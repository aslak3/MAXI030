/* verilator lint_off MULTITOP */

module spi_interface
    (
        input           reset,
        input           clock,

        input           write,
        input           cs,
        input [7:0]     data_in,

        output          sclk,
        output          mosi
    );

    reg trigger;
    reg [7:0] data;
    // TODO: Needs a status register for this
    wire running;

    always @ (posedge clock) begin
        if (reset) begin
            data <= 8'h0;
            trigger <= 1'b0;
        end else begin
            trigger <= 1'b0;
            if (write) begin
                if (cs) begin
                    data <= data_in;
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
