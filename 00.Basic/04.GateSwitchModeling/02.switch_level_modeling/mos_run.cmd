del wave
del wave.vcd
iverilog -o wave mos.v mos_tb.v
vvp wave
gtkwave dump.vcd
pause