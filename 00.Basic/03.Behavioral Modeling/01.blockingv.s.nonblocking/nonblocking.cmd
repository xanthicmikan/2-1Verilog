del wave
del wave.vcd
iverilog -o wave nonblocking_tb.v
vvp wave
gtkwave dump.vcd
pause