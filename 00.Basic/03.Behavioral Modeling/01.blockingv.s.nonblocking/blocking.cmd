del wave
del wave.vcd
iverilog -o wave blocking_tb.v
vvp wave
gtkwave dump.vcd
pause