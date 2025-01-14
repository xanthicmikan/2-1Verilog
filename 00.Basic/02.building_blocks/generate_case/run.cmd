del wave
del wave.vcd
iverilog -o wave my_top.v my_top_tb.v
vvp wave
gtkwave dump.vcd
pause