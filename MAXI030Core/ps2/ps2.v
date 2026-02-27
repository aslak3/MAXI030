/* verilator lint_off MULTITOP */

module ps2_edge_finder
	(
		input clock,

		output reg edge_found,

		input ps2_clock
	);

	reg [7:0] edge_finder = 8'h00;

	always @ (posedge clock) begin
		// Shift the incoming clock signal in
		edge_finder <= { edge_finder[6:0], ps2_clock };
		// Check for a match against a falling edge
		if (edge_finder == 8'hf0) begin
			edge_found <= 1'b0;
		end else if (edge_finder == 8'h0f) begin
			edge_found <= 1'b1;
		end
	end
endmodule

module ps2_rx_shifter
    (
        input clock,

        input edge_found,
        output reg [7:0] rx_scancode,
        output reg scancode_ready_set,
        output reg parity_error,

        input ps2_data                  // PS/2 data pin
    );

    localparam
        RX_START = 0,
        RX_BYTE = 1,
        RX_ODD_PARITY = 2,
        RX_STOP = 3;

    reg [7:0] byte_buffer;
    reg [2:0] bit_shift_counter;        // 0..7 bit count
    reg parity_check = 1'b0;
    reg [15:0] scancode_rx_counter;
    integer state = RX_START;
    reg last_edge_found;

    always @ (posedge clock) begin
        last_edge_found <= edge_found;
        scancode_ready_set <= 1'b0;

        if (scancode_rx_counter == 16'hffff) begin
            state <= RX_START;
        end

        scancode_rx_counter <= scancode_rx_counter + 16'h0001;

        if (~edge_found && last_edge_found) begin
            scancode_rx_counter <= 16'h0000;

            case (state)
                RX_START: begin
                    parity_error <= 1'b0;
                    bit_shift_counter <= 3'b000;
                    byte_buffer <= 8'h00;
                    parity_check <= 1'b1;
                    state <= RX_BYTE;
                end

                RX_BYTE: begin
                    parity_check <= parity_check ^ ps2_data;
                    byte_buffer[bit_shift_counter] <= ps2_data;
                    if (bit_shift_counter == 3'b111) begin
                        state <= RX_ODD_PARITY;
                    end
                    bit_shift_counter <= bit_shift_counter + 3'b001;
                end

                RX_ODD_PARITY: begin
                    // Check for an even number of ones: good!
                    if (parity_check == ~ps2_data) begin
                        parity_error <= 1'b0;
                    end else begin
                        parity_check <= 1'b1;
                    end
                    rx_scancode <= byte_buffer;
                    state <= RX_STOP;
                end

                RX_STOP: begin
                    scancode_ready_set <= 1'b1;
                    state <= RX_START;
                end
            endcase
        end
    end
endmodule