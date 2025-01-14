del wave
del wave.vcd
iverilog -o wave glitch_free.v glitch_free_tb.v
vvp wave
gtkwave dump.vcd
pause