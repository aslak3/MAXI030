/* verilator lint_off MULTITOP */

module brom
    (
        input       clock_one,
        input       clock_two,

        input       read,
        input       [8:0] addr_one,

        output reg  [15:0] dout_one,

        input       write,
        input       [8:0] addr_two,

        input       [15:0] din_two

    );

    reg [31:0] mem [0:511];

    initial begin
        $readmemh("brom.txt", mem);
    end

    always @ (posedge clock_one) begin
        if (read) begin
            dout_one <= mem[addr_one][15:0];
        end
    end

    always @ (posedge clock_two) begin
        if (write) begin
            mem[addr_two][15:0] <= din_two;
        end
    end

endmodule

