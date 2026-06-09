module sram_controller
    (
        input       reset,
        input       clock,

        // Display interface
        

        // CPU interface
        input       [20:1] cpu_addr,
        input       cpu_read_trigger,
        input       cpu_write_trigger,
        input       cpu_ucs,
        input       cpu_lcs,
        input       [15:0] cpu_data_in,
        output reg  [15:0] cpu_data_out,
        output reg  cpu_data_out_valid,
        output reg  cpu_read_ack,
        output reg  cpu_write_ack,
        output reg  cpu_busy,

        // SRAM
        output reg  [19:0] sram_addr,
        output reg  sram_n_vread,
        output reg  sram_n_vwrite,
        output reg  sram_n_ucs,
        output reg  sram_n_lcs,
        inout       [15:0] sram_data
    );

    localparam IDLE = 0;
    localparam READ_LATCH = 1;
    localparam WAIT_THEN_IDLE = 2;
    localparam EXTRA_WAIT = 3;
    localparam EXTRA_WAIT_2 = 4;

    reg [2:0] state = IDLE;

    always @ (posedge clock) begin
        if (reset) begin
            sram_n_vwrite <= 1'b1;
            sram_n_vread <= 1'b1;
            sram_n_ucs <= 1'b1;
            sram_n_lcs <= 1'b1;
            cpu_data_out_valid <= 1'b0;

            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    cpu_busy <= 1'b1;
                    cpu_data_out_valid <= 1'b0;

                    sram_n_vwrite <= 1'b1;
                    sram_n_vread <= 1'b1;
                    sram_n_ucs <= 1'b1;
                    sram_n_lcs <= 1'b1;
                    cpu_read_ack <= 1'b0;
                    cpu_write_ack <= 1'b0;

                    if (cpu_read_trigger) begin
                        sram_addr <= cpu_addr;
                        sram_n_vwrite <= 1'b1;
                        sram_n_vread <= 1'b0;
                        sram_n_ucs <= 1'b0;
                        sram_n_lcs <= 1'b0;

                        state <= EXTRA_WAIT;
                    end else if (cpu_write_trigger) begin
                        sram_addr <= cpu_addr;
                        sram_n_vwrite <= 1'b0;
                        sram_n_vread <= 1'b1;
                        sram_n_ucs <= ~cpu_ucs;
                        sram_n_lcs <= ~cpu_lcs;

                        state <= WAIT_THEN_IDLE;
                    end else begin
                        sram_n_vwrite <= 1'b1;
                        sram_n_vread <= 1'b1;

                        state <= IDLE;
                    end
                end

                EXTRA_WAIT: begin
                    state <= READ_LATCH;
                end

                READ_LATCH: begin
                    cpu_data_out_valid <= 1'b1;
                    cpu_data_out <= sram_data;

                    state <= WAIT_THEN_IDLE;
                end

                WAIT_THEN_IDLE: begin
                    // This will clear the triggers in the parent.
                    cpu_read_ack <= 1'b1;
                    cpu_write_ack <= 1'b1;
                    cpu_busy <= 1'b0;

                    // Continue on when we are not selected any more.
                    if (!cpu_ucs && !cpu_lcs) begin
                        cpu_busy <= 1'b1;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end

    assign sram_data = !sram_n_vwrite ? cpu_data_in : 16'hzzzz;
endmodule
