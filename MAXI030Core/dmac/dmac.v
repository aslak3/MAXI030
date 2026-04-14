/* verilator lint_off MULTITOP */

module dmac
	(
        input 		reset,				// Master reset
        input 		clock,				// Master clock

        input 		trigger,
        input       [31:0] src_addr,
        input       [31:0] dst_addr,
        input       [15:0] length,

        output reg  br,
        input       bg,
        output reg  bgack,
        input       ext_as,
        output reg  [31:0] addr,
        output reg  rn_w,
        output reg  as,
        output reg  ds,
        output reg  [1:0] siz,
        output reg  [2:0] fc,
        input       [31:0] data_in,
        output reg  [31:0] data_out,
        input       [1:0] dsack,

        output      trace
    );

    localparam  IDLE = 0,
                WAITING_BG = 1,
                WAITING_AS = 2,
		        SENT_BGACK = 3,
                START_READ = 4,
                READ_EMPTY = 5,
                READ_WAIT_DSACK = 6,
                START_WRITE = 7,
                WRITE_EMPTY = 8,
                WRITE_WAIT_DSACK = 9,
                DONE = 10;

    reg [15:0] read_length_countup;
    reg [15:0] write_length_countup;
    reg [31:0] data_item;
    reg [1:0] siz_countdown;
    integer state;
    reg [3:0] got_data;

    always @ (posedge clock) begin
        if (reset) begin
            state <= IDLE;
            br <= 1'b0;
            bgack <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    bgack <= 1'b0;
                    br <= 1'b0;
                    if (trigger) begin
                        read_length_countup <= 16'h0000;
                        write_length_countup <= 16'h0000;
                        br <= 1'b1;
                        state <= WAITING_BG;
                    end
                end

                WAITING_BG: begin
                    if (bg) begin
                        br <= 1'b0;
                        state <= WAITING_AS;
                    end
                end

                WAITING_AS: begin
                    if (!ext_as) begin
                        bgack <= 1'b1;
                        got_data = 4'b0000;
                        state <= START_READ;
                    end
                end

                START_READ: begin
                    addr <= src_addr + { 16'h0000, read_length_countup };
                    rn_w <= 1'b1;
                    as <= 1'b1;
                    ds <= 1'b1;
                    case (got_data)
                        4'b0000: siz <= `SIZE_FOUR;
                        4'b0011: siz <= `SIZE_TWO;
                        4'b1100: siz <= `SIZE_TWO;
                        default: siz <= `SIZE_ONE;
                    endcase

                    if (read_length_countup == length) begin
                        state <= IDLE;
                    end else begin
                        state <= READ_EMPTY;
                    end
                end

                READ_EMPTY: begin
                    state <= READ_WAIT_DSACK;
                end

                READ_WAIT_DSACK: begin
                    as <= 1'b0;
                    ds <= 1'b0;
                    state <= START_READ;
                    case (dsack)
                        `PORT_WIDTH_LONG: begin
                            read_length_countup <= read_length_countup + 16'd4;
                            data_item <= data_in;
                            got_data = 4'b1111;
                        end
                        `PORT_WIDTH_WORD: begin
                            read_length_countup <= read_length_countup + 16'd2;
                            if (addr[1] == 1'b0) begin
                                data_item[31:16] <= data_in[31:16];
                                got_data[3:2] = 2'b11;
                            end else begin
                                data_item[15:0] <= data_in[31:16];
                                got_data[1:0] = 2'b11;
                            end
                        end
                        default: begin
                            as <= 1'b1;
                            ds <= 1'b1;
                            state <= READ_WAIT_DSACK;
                        end
                    endcase

                    if (got_data == 4'b1111) begin
                        state <= START_WRITE;
                        got_data = 4'b0000;
                    end
                end

                START_WRITE: begin
                    addr <= dst_addr + { 16'h0000, write_length_countup };
                    rn_w <= 1'b0;
                    as <= 1'b1;
                    ds <= 1'b1;
                    siz <= `SIZE_FOUR;
                    fc <= 3'b000;
                    data_out <= data_item;
                    state <= WRITE_EMPTY;
                end

                WRITE_EMPTY: begin
                    state <= WRITE_WAIT_DSACK;
                end

                WRITE_WAIT_DSACK: begin
                    case (dsack)
                        `PORT_WIDTH_LONG: begin
                            write_length_countup <= write_length_countup + 16'd4;
                            as <= 1'b0;
                            ds <= 1'b0;
                            state <= START_READ;
                        end
                        default: begin
                        end
                    endcase
                end
            endcase
        end
    end

    assign trace = state == READ_WAIT_DSACK | state == WRITE_WAIT_DSACK;
endmodule
