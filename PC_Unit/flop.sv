module flop(
    input  logic        clk,
    input  logic        rst,
    input  logic [31:0] d,
    output logic [31:0] q);

    // Register Flipflop
    always_ff @(posedge clk)
        if (rst) q <= 32'b0;
        else q <= d;

endmodule
