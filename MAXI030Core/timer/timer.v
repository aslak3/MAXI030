/* verilator lint_off MULTITOP */

module timer
    (
        input       reset,
        input       clock,

        input       [31:0] start_value,
        input       start_trigger,
        input       stop_trigger,

        output reg  irq,
        output reg  [31:0] current_value
    );

    reg running;

    always @ (posedge clock) begin
        if (reset) begin
            running <= 1'b0;
            current_value <= 32'd0;
        end else begin
            if (start_trigger) begin
                irq <= 1'b0;
                if (!running) begin
                    running <= 1'b1;
                    current_value <= start_value;
                end
            end else if (stop_trigger) begin
                running <= 1'b0;
                irq <= 1'b0;
            end else if (running) begin
                current_value <= current_value - 32'd1;
                if (current_value == 32'd0) begin
                    current_value <= start_value;
                    irq <= 1'b1;
                end
            end
        end
    end
endmodule
