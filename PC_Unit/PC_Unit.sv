module PC_Unit(
    input  logic        clk,
    input  logic        rst,
    input  logic        PCsrc,
    input  logic [31:0] ImmOp,
    output logic [31:0] pc);

    logic   [31:0]  next_pc;
    logic   [31:0]  branch_pc;
    logic   [31:0]  inc_pc;

flop PC_Reg (
    .clk (clk),
    .rst (rst),
    .d   (next_pc),
    .q   (pc)
);

adder4 PC_Inc (
    .add_in     (pc),
    .inc_result (inc_pc)
);

adder_32bit branch_adder(
    .add1    (pc),
    .add2    (ImmOp),
    .result  (branch_pc)
);

    assign next_pc = PCsrc ? branch_pc : inc_pc;

endmodule

