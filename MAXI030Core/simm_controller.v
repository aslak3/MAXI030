/* verilator lint_off MULTITOP */

module simm_controller
    (
        input reset,
        input clock,

        input cs,
        input ds,
        input rn_w,
        input bank_addr,
        input [3:0] byte_selects,

        output reg write,
        output reg [3:0] ras,
        output reg [3:0] cas,
        output reg waitstate,
        output reg mux_select
    );

    // Define the states
    localparam IDLE = 0;
    localparam MEMRW1 = 1;
    localparam MEMRW2 = 2;
    localparam REFRESH1 = 3;
    localparam REFRESH2 = 4;
    localparam REFRESH3 = 5;
    localparam REFRESH4 = 6;

    reg [7:0] refresh_count;
    integer state;
    reg needs_refresh;

    always @ (posedge clock) begin
        if (reset) begin
            refresh_count <= 8'd0;
            write <= 1'b0;
            mux_select <= 1'b1;
            ras <= 4'b0000;
            cas <= 4'b0000;
            waitstate <= 1'b1;
            needs_refresh <= 1'b0;
            state <= IDLE;
        end else begin
            refresh_count <= refresh_count + 8'd1;
            if (refresh_count == 8'd250) begin
                refresh_count <= 8'd0;
                needs_refresh <= 1'b1;
            end

            case (state)
                IDLE: begin
                    write <= 1'b0;
                    mux_select <= 1'b0;
                    ras <= 4'b0000;
                    cas <= 4'b0000;
                    waitstate <= 1'b1;

                    if (needs_refresh) begin
                        needs_refresh <= 1'b0;
                        state <= REFRESH1;
                    end else if (cs && ds) begin
                        write <= ~rn_w;
                        if (bank_addr) begin
                            ras <= 4'b0101;
                        end else begin
                            ras <= 4'b1010;
                        end
                        state <= MEMRW1;
                    end else begin
                        state <= IDLE;
                    end
                end

                MEMRW1: begin
                    mux_select <= 1'b1;
                    state <= MEMRW2;
                end

                MEMRW2: begin
                    if (rn_w == 1'b0) begin
                        // Writing? Select only needed bytes
                        cas <= byte_selects;
                    end else begin
                        // Reading? Select them all, needed for cache
                        cas <= 4'b1111;
                    end

                    waitstate <= 1'b0;
                    if (cs) begin
                        state <= MEMRW2;
                    end else begin
                        state <= IDLE;
                    end
                end

                REFRESH1: begin
                    cas <= 4'b1111;
                    state <= REFRESH2;
                end

                REFRESH2: begin
                    ras <= 4'b1111;
                    state <= REFRESH3;
                end

                REFRESH3: begin
                    cas <= 4'b0000;
                    state <= REFRESH4;
                end

                REFRESH4: begin
                    ras <= 4'b0000;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule

module simm_mux
    (
        input mux_select,
        input [31:0] addr_in,

        output [11:0] addr_out
    );

    // 8 MB
    // assign addr_out[9:0] <=        mux_select ?
    //                                 addr_in[9 + 3:3] :
    //                                 addr_in[9 + 10 + 3:10 + 3];
    // assign addr_out [11:10] =    2'b00;

    // 32 MB
    assign addr_out[10:0] = mux_select ?
                            addr_in[10 + 2:2] :
                            addr_in[10 + 11 + 2:11 + 2];
    assign addr_out[11] =     1'b0;
endmodule
