module adder_32bit(
    input   logic [31:0]  add1,
    input   logic [31:0]  add2,
    output  logic [31:0]  result);

    // 32 bit adder
    assign result = add1 + add2;

endmodule
