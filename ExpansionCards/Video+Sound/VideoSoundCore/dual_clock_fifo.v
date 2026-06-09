// gpt-oss:20b generated.

module dual_clock_fifo #(
    parameter DEPTH     = 16,                 // must be power of two
    parameter WIDTH     = 8,
    parameter PTR_WIDTH = 4                  // log2(DEPTH); change if DEPTH changes
)(
    // Write clock domain
    input  wire                 wr_clk,
    input  wire                 wr_rst_n,
    input  wire                 wr_en,
    input  wire [WIDTH-1:0]     din,

    // Read clock domain
    input  wire                 rd_clk,
    input  wire                 rd_rst_n,
    input  wire                 rd_en,
    output reg  [WIDTH-1:0]     dout,

    // Status flags (in their respective domains)
    output wire                 full,
    output wire                 empty
);

    //=================================================================
    //  1. FIFO storage
    //=================================================================
    reg [WIDTH-1:0] mem [0:DEPTH-1];

    //=================================================================
    //  2. Pointer registers (binary)
    //=================================================================
    reg [PTR_WIDTH-1:0] wr_ptr_bin = 0;
    reg [PTR_WIDTH-1:0] rd_ptr_bin = 0;

    //=================================================================
    //  3. Gray coded versions
    //=================================================================
    function [PTR_WIDTH-1:0] bin_to_gray;
        input [PTR_WIDTH-1:0] bin;
        begin
            bin_to_gray = bin ^ (bin >> 1);
        end
    endfunction

    function [PTR_WIDTH-1:0] gray_to_bin;
        input [PTR_WIDTH-1:0] gray;
        integer i;
        begin
            gray_to_bin = gray;
            for (i = PTR_WIDTH-1; i > 0; i = i-1)
                gray_to_bin[i-1] = gray_to_bin[i] ^ gray[i-1];
        end
    endfunction

    // Write pointer (binary & gray)
    wire [PTR_WIDTH-1:0] wr_ptr_gray = bin_to_gray(wr_ptr_bin);

    // Read pointer (binary & gray)
    wire [PTR_WIDTH-1:0] rd_ptr_gray = bin_to_gray(rd_ptr_bin);

    //=================================================================
    //  4. Cross‑domain synchronisers (two‑stage)
    //=================================================================
    // Write side receives the read pointer (gray) from read clock domain
    reg [PTR_WIDTH-1:0] rd_ptr_gray_sync_1 = 0, rd_ptr_gray_sync_2 = 0;
    // Read side receives the write pointer (gray) from write clock domain
    reg [PTR_WIDTH-1:0] wr_ptr_gray_sync_1 = 0, wr_ptr_gray_sync_2 = 0;

    // Sync read pointer into write clock domain
    always @(posedge wr_clk or negedge wr_rst_n) begin
        if (!wr_rst_n) begin
            rd_ptr_gray_sync_1 <= {PTR_WIDTH{1'b0}};
            rd_ptr_gray_sync_2 <= {PTR_WIDTH{1'b0}};
        end else begin
            rd_ptr_gray_sync_1 <= rd_ptr_gray;
            rd_ptr_gray_sync_2 <= rd_ptr_gray_sync_1;
        end
    end

    // Sync write pointer into read clock domain
    always @(posedge rd_clk or negedge rd_rst_n) begin
        if (!rd_rst_n) begin
            wr_ptr_gray_sync_1 <= {PTR_WIDTH{1'b0}};
            wr_ptr_gray_sync_2 <= {PTR_WIDTH{1'b0}};
        end else begin
            wr_ptr_gray_sync_1 <= wr_ptr_gray;
            wr_ptr_gray_sync_2 <= wr_ptr_gray_sync_1;
        end
    end

    // Convert synchronized Gray back to binary in each domain
    wire [PTR_WIDTH-1:0] rd_ptr_bin_sync_w = gray_to_bin(rd_ptr_gray_sync_2);
    wire [PTR_WIDTH-1:0] wr_ptr_bin_sync_r = gray_to_bin(wr_ptr_gray_sync_2);

    //=================================================================
    //  5. Status flag logic
    //=================================================================
    // Write side full: next write pointer would equal the synchronized
    // read pointer
    assign full = ((wr_ptr_bin + 1'b1) == rd_ptr_bin_sync_w);

    // Read side empty: write pointer (synchronized) equals read pointer
    assign empty = (wr_ptr_bin_sync_r == rd_ptr_bin);

    //=================================================================
    //  6. Write logic (write clock domain)
    //=================================================================
    always @(posedge wr_clk or negedge wr_rst_n) begin
        if (!wr_rst_n) begin
            wr_ptr_bin <= {PTR_WIDTH{1'b0}};
        end else if (wr_en && !full) begin
            mem[wr_ptr_bin] <= din;           // write data
            wr_ptr_bin <= wr_ptr_bin + 1'b1;   // advance write pointer
        end
    end

    //=================================================================
    //  7. Read logic (read clock domain)
    //=================================================================
    always @(posedge rd_clk or negedge rd_rst_n) begin
        if (!rd_rst_n) begin
            rd_ptr_bin <= {PTR_WIDTH{1'b0}};
            dout      <= {WIDTH{1'b0}};
        end else if (rd_en && !empty) begin
            dout      <= mem[rd_ptr_bin];     // read data
            rd_ptr_bin <= rd_ptr_bin + 1'b1;   // advance read pointer
        end
    end

endmodule
