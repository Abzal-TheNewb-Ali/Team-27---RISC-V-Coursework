module PC_Unit(
    input  logic        clk,
    input  logic        rst,
    input  logic        PCsrc,
    input  logic [31:0] ImmOp,
    output logic [31:0] pc);
    
    //Interconnect Wires
    logic   [31:0]  next_pc;
    logic   [31:0]  branch_pc;
    logic   [31:0]  inc_pc;

//PC Register 32-bit flip flop submodule
flop PC_Reg (
    .clk (clk),
    .rst (rst),
    .d   (next_pc),
    .q   (pc)
);

//+4 increment submodule 
adder4 PC_Inc (
    .add_in     (pc),
    .inc_result (inc_pc)
);

//PC + ImmOp adder 32-bit
adder_32bit branch_adder(
    .add1    (pc),
    .add2    (ImmOp),
    .result  (branch_pc)
);

    //PC Type multiplexer
    assign next_pc = PCsrc ? branch_pc : inc_pc;

endmodule

