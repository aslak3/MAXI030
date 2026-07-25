module sram_controller
    (
        input       reset,
        input       clock,

        // Display FIFO interface
        input       [20:1] fifo_addr,
        input       fifo_read_trigger,
        output reg  [15:0] fifo_data_out,
        output reg  fifo_data_out_valid,

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

    typedef enum reg [2:0] {
        IDLE,
        FIFO_READ_WAIT, FIFO_READ_LATCH,
        CPU_READ_WAIT, CPU_READ_LATCH, CPU_WAIT_THEN_IDLE
    } state_t;

    state_t state = IDLE;

    always @ (posedge clock) begin
        if (reset) begin
            sram_n_vwrite <= 1'b1;
            sram_n_vread <= 1'b1;
            sram_n_ucs <= 1'b1;
            sram_n_lcs <= 1'b1;
            fifo_data_out_valid <= 1'b0;
            cpu_data_out_valid <= 1'b0;

            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    fifo_data_out_valid <= 1'b0;
                    cpu_read_ack <= 1'b0;
                    cpu_write_ack <= 1'b0;
                    cpu_busy <= 1'b1;
                    cpu_data_out_valid <= 1'b0;
                    sram_n_vwrite <= 1'b1;
                    sram_n_vread <= 1'b1;
                    sram_n_ucs <= 1'b1;
                    sram_n_lcs <= 1'b1;
                    
                    if (fifo_read_trigger) begin
                        sram_addr <= fifo_addr;
                        sram_n_vwrite <= 1'b1;
                        sram_n_vread <= 1'b0;
                        sram_n_ucs <= 1'b0;
                        sram_n_lcs <= 1'b0;
                    
                        state <= FIFO_READ_WAIT;
                    end else if (cpu_read_trigger) begin
                        sram_addr <= cpu_addr;
                        sram_n_vwrite <= 1'b1;
                        sram_n_vread <= 1'b0;
                        sram_n_ucs <= 1'b0;
                        sram_n_lcs <= 1'b0;

                        state <= CPU_READ_WAIT;
                    end else if (cpu_write_trigger) begin
                        sram_addr <= cpu_addr;
                        sram_n_vwrite <= 1'b0;
                        sram_n_vread <= 1'b1;
                        sram_n_ucs <= ~cpu_ucs;
                        sram_n_lcs <= ~cpu_lcs;

                        state <= CPU_WAIT_THEN_IDLE;
                    end else begin
                        sram_n_vwrite <= 1'b1;
                        sram_n_vread <= 1'b1;

                        state <= IDLE;
                    end
                end
                
                FIFO_READ_WAIT: begin
                    state <= FIFO_READ_LATCH;
                end
                
                FIFO_READ_LATCH: begin
                    fifo_data_out <= { sram_data[7:0], sram_data[15:8] };
                    fifo_data_out_valid <= 1'b1;
                    
                    state <= IDLE;
                end

                CPU_READ_WAIT: begin
                    state <= CPU_READ_LATCH;
                end

                CPU_READ_LATCH: begin
                    cpu_data_out <= sram_data;
                    cpu_data_out_valid <= 1'b1;

                    state <= CPU_WAIT_THEN_IDLE;
                end

                CPU_WAIT_THEN_IDLE: begin
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
                
                default: begin
                end
            endcase
        end
    end

    assign sram_data = !sram_n_vwrite ? cpu_data_in : 16'hzzzz;
endmodule
