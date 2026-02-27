/* verilator lint_off MULTITOP */

module i2c
	(
        input clock,					// Master clock
        input reset,					// Master reset

        input trigger,					// Continue on after pause
        input restart,					// Generates a new START
        input last_byte,				// This is the last byte to read/write
        input [6:0] address,		    // Slave address
        input read_write,				// 0=write, 1=read
        input [7:0] write_data,         // Data to write
        output reg [7:0] read_data,     // Data we have read
        output reg ack_error,			// 0=ACK, 1=NAK
        output busy,					// Controller is processing

        inout scl,					    // Tri-state
        inout sda					    // Ditto
    );

    localparam  START1 = 0,
                START2 = 1,
		        WRITING_DATA = 2,
                WRITING_ACK = 3,
                WRITE_WAITING = 4,
		        READING_DATA = 5,
                READING_ACK = 6,
                READ_WAITING = 7,
		        STOP1 = 8,
                STOP2 = 9,
                STOP3 = 10,
		        RESTART1 = 11;

	reg running = 1'b0;				// Not idle; trigger recieved
	reg pause_running = 1'b0;		// Used to wait for next trigger
	reg running_clock;				// Generator of 100KHz ish SCL
	reg previous_running_clock;		// Used to find the edge
    integer state = START1;			// Current state
	reg scl_local = 1'b1;			// Local copies of output
	reg sda_local = 1'b1;			// Ditto
    // Non blocking
    reg [7:0] i2c_clock_counter;
    reg clock_flip = 1'b0;
    integer bit_counter = 0;
    reg [7:0] data_to_write;    // May be a slave address or actual data

    always @ (posedge clock) begin
		if (reset) begin
			i2c_clock_counter = 8'b0;
			running <= 1'b0;
            pause_running <= 1'b0;
            clock_flip = 1'b0;
            bit_counter = 0;
            data_to_write = 8'h00;
			// Tri-state outputs
			scl_local <= 1'b1;
			sda_local <= 1'b1;
			state <= START1;
        end else begin
			if (trigger) begin
				// On a trigger, enter running state, clear the counter
				running <= 1'b1;
				i2c_clock_counter = 8'b0;
			end
			if (running) begin
				// If we are running, inc the counter && extract the MSB for 2nd process
				i2c_clock_counter = i2c_clock_counter + 8'b1;
				previous_running_clock <= running_clock;
				running_clock <= i2c_clock_counter[7];
			end
			if (pause_running) begin
				// Handle the 2nd process wanting to wait for a trigger (eg. the next byte to write)
				running <= 1'b0;
			end

			// Assume we are not pausing
			pause_running <= 1'b0;

			if (restart) begin
				// On restart force the state
				state <= RESTART1;
			end

			if (running && running_clock && ~previous_running_clock) begin
				case (state)
					START1: begin
						scl_local <= 1'b1;
						sda_local <= 1'b1;
						state <= START2;
                    end

					START2: begin
						// Prepare for sending the address by setting bit count up && setting up the
						// byte value we are writing to the address + read/write mode
						sda_local <= 1'b0;
						clock_flip = 1'b0;
						bit_counter = 8;
						data_to_write = { address, read_write };
						state <= WRITING_DATA;
                    end

					WRITING_DATA: begin
						// Two cycles per bit
						scl_local <= clock_flip;
						// Assert the actual bit we are writing using the bit_counter
						sda_local <= data_to_write[bit_counter - 1];
						if (clock_flip) begin
							// Clock going down, begin next bit and move to ACK if all are sent
							bit_counter = bit_counter - 1;
							if (bit_counter == 0) begin
								state <= WRITING_ACK;
							end
						end
						clock_flip = ~clock_flip;
                    end

					WRITING_ACK: begin
						scl_local <= clock_flip;
						// Tri-state the SDA as an input
						sda_local <= 1'b1;
						if (clock_flip) begin
							// Latch the SDA input
							ack_error <= sda;
							if (last_byte) begin
								// Last byte to write? Generate a STOP sequence
								state <= STOP1;
                            end else begin
								// Otherwise wait for the next trigger. We might be reading or writing now, as
								// this byte sent might have been the slave address
								pause_running <= 1'b1;
								if (~read_write) begin
									state <= WRITE_WAITING;
                                end else begin
									state <= READ_WAITING;
								end
							end
						end
						clock_flip = ~clock_flip;
                    end

					WRITE_WAITING: begin
						// Get ready for the next byte to write
						data_to_write = write_data;
						bit_counter = 8;
						state <= WRITING_DATA;
                    end

					READING_DATA: begin
						scl_local <= clock_flip;
						// Tri-state the SDA so we can input on it
						sda_local <= 1'b1;
						if (clock_flip) begin
							// Clock going down, begin decreemnt the bit count && at the end, switch to reading
							// ACK state
							bit_counter = bit_counter - 1;
							if (bit_counter == 0) begin
								state <= READING_ACK;
							end
							// Get the actual data bit
							read_data[bit_counter] <= sda;
						end
						clock_flip = ~clock_flip;
                    end

					READING_ACK: begin
						scl_local <= clock_flip;
						// ACK or NAK based on wether this is the last byte
						sda_local <= last_byte;
						if (clock_flip) begin
							// Clock going down? If this is the last byte we need to STOP,
							// otherwise wait on trigger for the next byte to read
							if (last_byte) begin
								state <= STOP1;
                            end else begin
								pause_running <= 1'b1;
								state <= READ_WAITING;
							end
						end
						clock_flip = ~clock_flip;
                    end

					READ_WAITING: begin
						// Prepare the bit counter
						bit_counter = 8;
						state <= READING_DATA;
                    end

					STOP1: begin
						sda_local <= 1'b0;
						scl_local <= 1'b0;
						state <= STOP2;
                    end

					STOP2: begin
						scl_local <= 1'b1;
						state <= STOP3;
                    end

					STOP3: begin
						// Wait for next trigger to start the next transaction
						sda_local <= 1'b1;
						pause_running <= 1'b1;
						state <= START1;
                    end

					RESTART1: begin
						// Full START by setting the outputs to 0 seems to be needed
						scl_local <= 1'b0;
						sda_local <= 1'b0;
						state <= START1;
                    end
                endcase
            end
		end
	end

	assign busy = running;

	// Tri-state if the internal reg is 1
	assign scl = scl_local == 1'b1 ? 1'bz : 1'b0;
	assign sda = sda_local == 1'b1 ? 1'bz : 1'b0;
endmodule
