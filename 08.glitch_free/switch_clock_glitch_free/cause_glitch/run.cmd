del wave
del wave.vcd
iverilog -o wave glitch.v glitch_tb.v
vvp wave
gtkwave dump.vcd
pause