#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f counter.vcd

#run verilator to translate Verilog into C++, merge withe testbanhc
verilator -Wall --cc --trace Vredurisc.sv --exe RISCV_tb.cpp

#build the C++ project via make
make -j -C obj_dir/ -f Vredurisc.mk Vredurisc

#run the final sim exe
obj_dir/Vredurisc