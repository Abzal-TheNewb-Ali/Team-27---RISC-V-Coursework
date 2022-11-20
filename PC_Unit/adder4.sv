module adder4(
    input   logic [31:0] add_in,
    output  logic [31:0] inc_result);

    // +4 increment
    assign inc_result = add_in + 32'd4;

endmodule
