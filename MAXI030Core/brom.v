/* verilator lint_off MULTITOP */

module brom
    (
        input clock,

        input [8:0] addr,

        output reg [31:0] dout
    );

    reg [31:0] mem [0:511];

    initial begin
        $readmemh("brom.txt", mem);
    end

    always @ (posedge clock) begin
        dout <= mem[addr];
    end
endmodule

