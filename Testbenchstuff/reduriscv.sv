//top level module
module reduriscv(
//no parameters

    input   logic     clk,    //clock
    input   logic     rst,    //reset
    output  logic     a0      //Ccounter output, relates to register a0

);
//assign the inputs to the outputs and dfine the internal signals(like the CU outputs)

//Internal signals (Oragnised by outputs)
//PC
logic [31:0]    pc;

//CU (with assumed names)
logic [31:0]    Instr;//To be spilt when assigning to CU and other modules
logic           RegWrite;
logic           ALUctrl;
logic           ALUsrc;
logic           ImmSrc;
logic           PCsrc;
logic [31:0]    ImmOp;

//Reg File and ALU (with assumed names)
logic           EQ;

PC_Unit PC(
    .clk(clk),
    .rst(rst),
    .PCsrc(PCsrc),
    .Immop(Immop),
    .pc(pc)
)

//insantiation of the other modules



endmodule