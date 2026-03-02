/* verilator lint_off MULTITOP */

module led_interface
    (
        input       reset,
        input       clock,

        input       read,
        input       write,

        input       cs,
        input       [7:0] data_in,
        output reg  [7:0] data_out,
        output      data_out_valid,

        output reg  led
    );

    always @ (*) begin
        if (cs) begin
            data_out = { 7'b0000000, led };
        end else begin
            data_out = { 8'h0 };
        end
    end

    assign data_out_valid = read && cs ? 1'b1 : 1'b0;

    always @ (posedge clock) begin
        if (reset) begin
            led <= 1'b0;
        end else begin
            if (write) begin
                if (cs) begin
                    // Sets the output directly, a trivial module would just be silly.
                    led <= data_in[0];
                end
            end
        end
    end
endmodule
