del wave
del wave.vcd
iverilog -o wave specify.v specify_tb.v
vvp wave
gtkwave dump.vcd
pause