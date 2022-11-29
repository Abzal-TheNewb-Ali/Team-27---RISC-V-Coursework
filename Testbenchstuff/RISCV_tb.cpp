/*
This testbench is based off of the template provided in Lab 1
Essentially the same as the testbench for lab 1 as the program itself replicates the counter
*/

#include "Vreduriscv.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv, char **env){
    //Initialise clock components
    int i;
    int clk;

    //Intialse verlator components
    Verilated::commandArgs(argc, argv);
    //instance of top-level module
    Vreduriscv* top = new Vreduriscv;

    //trace dump (gtkWave ouput)
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99);
    tfp->open ("counter.vcd");// Left the same as the vcd should be the same as the one from Lab1

    //initialise sim inputs
    top->clk = 1;
    top->rst = 1;

    //run sim
    for (i=0; i<300; i++) {

        //dump variables into vcd file and toggle clock
        for (clk=0; clk<2; clk++){
            tfp->dump (2*i+clk);
            top->clk = !top->clk;
            top->eval ();
        }

        //conditions for sim behaviour, change to test behaviour
        top->rst = (i<2) | (i == 15);
    }
    tfp->close();
    exit(0);
}