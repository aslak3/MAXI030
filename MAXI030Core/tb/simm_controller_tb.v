module simm_controller_tb;
    // Inputs
    reg reset;
    reg clock;
    reg cs;
    reg read;
    reg write;
    reg bank_addr;
    reg [3:0] byte_selects;

    // Outputs
    wire [3:0] ras;
    wire [3:0] cas;
    wire waitstate;
    wire mux_select;

    // Instantiate the simm_controller
    simm_controller dut (
        .reset(reset),
        .clock(clock),
        .cs(cs),
        .read(read),
        .write(write),
        .bank_addr(bank_addr),
        .byte_selects(byte_selects),

        .ras(ras),
        .cas(cas),
        .waitstate(waitstate),
        .mux_select(mux_select)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #1 clock = ~clock;
    end

    // VCD waveform dumping
    initial begin
        $dumpfile("simm_controller.vcd");
        $dumpvars(0, simm_controller_tb);
    end

    // Test stimulus
    initial begin
        // Reset
        reset = 1;
        #10
        reset = 0;

        // Idle state: no signals active
        cs = 0; read = 0; write = 0; bank_addr = 0; byte_selects = 4'b0000;
        #3000;

        // Busy state: memory read
        cs = 1; read = 1; write = 0; bank_addr = 0; byte_selects = 4'b0011;
        wait (!waitstate);
        cs = 0; read = 0; write = 0; bank_addr = 0; byte_selects = 4'b0000;
        #50;

        // Busy state: memory write
        cs = 1; read = 1; write = 0; bank_addr = 0; byte_selects = 4'b0011;
        wait (!waitstate);

        #50;
        cs = 1; read = 0; write = 1; bank_addr = 0; byte_selects = 4'b0011;

        // Refresh sequence
        cs = 0; read = 0; write = 0; bank_addr = 0; byte_selects = 4'b0000;
        #1000;

        // End simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time %0t: state: %d, ras=%b, cas=%b, waitstate=%b, mux_select=%b",
            $time, dut.state, ras, cas, waitstate, mux_select);
    end
endmodule