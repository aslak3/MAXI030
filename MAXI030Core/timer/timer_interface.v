/* verilator lint_off MULTITOP */

module timer_interface
    (
        input       reset,
        input       clock,

        input       read,
        input       write,
        input       start_value_cs,
        input       current_value_cs,
        input       control_cs,
        input       [31:0] data_in,
        output reg  [31:0] data_out,
        output      data_out_valid,

        output      irq
    );

    reg [31:0] start_value;
    reg start_trigger;
    reg stop_trigger;
    wire [31:0] current_value;

    always @ (*) begin
        if (start_value_cs) begin
            data_out = start_value;
        end else if (current_value_cs) begin
            data_out = current_value;
        end else if (control_cs) begin
            data_out = { 31'b0, irq };
        end else begin
            data_out = 32'h0;
        end
    end

    assign data_out_valid = read && (start_value_cs || current_value_cs || control_cs) ?
        1'b1 : 1'b0;

    always @ (posedge clock) begin
        if (reset) begin
            start_value <= 32'h0;
            start_trigger <= 1'b0;
            stop_trigger <= 1'b0;
        end else begin
            start_trigger <= 1'b0;
            stop_trigger <= 1'b0;

            if (write) begin
                if (start_value_cs) begin
                    start_value <= data_in;
                end else if (control_cs) begin
                    start_trigger <= data_in[0];
                    stop_trigger <= data_in[1];
                end
            end
        end
    end

    timer timer (
        .reset(reset),
        .clock(clock),

        .start_value(start_value),
        .start_trigger(start_trigger),
        .stop_trigger(stop_trigger),

        .irq(irq),
        .current_value(current_value)
    );
endmodule
