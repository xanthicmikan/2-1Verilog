del wave
del wave.vcd
iverilog -o wave pdet.v pdet_tb.v
vvp wave
gtkwave dump.vcd
pause