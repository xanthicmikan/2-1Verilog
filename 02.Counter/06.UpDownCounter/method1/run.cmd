del wave
del wave.vcd
iverilog -o wave ctr.v ctr_tb.v
vvp wave
gtkwave dump.vcd
pause