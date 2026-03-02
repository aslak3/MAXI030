/* verilator lint_off MULTITOP */

module spi (
    input           reset,      // Clear state
    input           clock,      // Ticker (posedge clock)

    input           trigger,    // Start/stop shift
    input [7:0]     out_byte,   // Byte to shift out

    output          sclk,       // SPI clock line
    output          mosi,       // Master Out Slave In

    output reg      running     // Used to pass back status
);

    reg [7:0] out_state;    // Byte currently being shifted out
    reg [2:0] counter;      // 3‑bit bit counter (0‑7)
    reg tick;               // In/Out half‑cycle toggle

    always @ (posedge clock) begin
        if (reset) begin
            running <= 1'b0;
        end else if (trigger) begin
            out_state <= out_byte;
            counter   <= 3'b000;
            running   <= 1'b1;
            tick      <= 1'b0;
        end else begin
            if (running) begin
                if (tick) begin
                    // Output half‑cycle: shift out_state left
                    out_state <= { out_state[6:0], 1'b0 };

                    counter   <= counter + 1'b1;

                    // All 8 bits sent? Stop transfer
                    if (counter == 3'b111) begin
                        running <= 1'b0;
                    end
                end

                // Toggle half‑cycle flag on every rising edge while running
                tick <= ~tick;
            end
        end
    end

    assign mosi = running ? out_state[7] : 1'b0;
    assign sclk = running ? tick         : 1'b0;
endmodule
