del wave
del wave.vcd
iverilog -o wave Dlatch.v Dlatch_tb.v
vvp wave
gtkwave dump.vcd
pause