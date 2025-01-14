del wave
del wave.vcd
iverilog -o wave alu74181.v alu74181_tb.v
vvp wave
gtkwave dump.vcd
pause