del wave
del wave.vcd
iverilog -o wave alu.v alu_tb.v
vvp wave
gtkwave dump.vcd
pause