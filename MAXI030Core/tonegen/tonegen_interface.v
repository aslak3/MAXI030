/* verilator lint_off MULTITOP */

module tonegen_interface
    (
        input       reset,
        input       clock,

        input       read,
        input       write,
        input       duration_cs,
        input       period_cs,
        input       status_cs,
        input       [15:0] data_in,
        output reg  [15:0] data_out,
        output      data_out_valid,

        output      buzzer
    );

    reg [15:0] duration = 16'h0;
    reg [15:0] period = 16'h0;
    reg tone_start;
    wire playing;

    always @ (posedge clock) begin
        if (reset) begin
            duration <= 16'h0;
            period <= 16'h0;
            tone_start <= 1'b0;
        end else begin
            tone_start <= 1'b0;
            if (write) begin
                if (duration_cs) begin
                    duration <= data_in;
                    tone_start <= 1'b1;
                end else if (period_cs) begin
                    period <= data_in;
                end
            end
        end
    end

    always @ (*) begin
        if (duration_cs) begin
            data_out = duration;
        end else if (period_cs) begin
            data_out = period;
        end else if (status_cs) begin
            data_out = { 15'b0, playing };
        end else begin
            data_out = { 16'h0 };
        end
    end

    assign data_out_valid =
        read && (duration_cs || period_cs || status_cs) ? 1'b1 : 1'b0;

    tonegen tonegen (
        .reset(reset),
        .clock(clock),

        .duration(duration),
        .period(period),
        .tone_start(tone_start),
        .buzzer(buzzer),
        .playing(playing)
    );
endmodule