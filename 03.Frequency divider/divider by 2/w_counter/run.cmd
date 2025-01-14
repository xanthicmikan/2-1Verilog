del wave
del wave.vcd
iverilog -o wave divider.v divider_tb.v
vvp wave
gtkwave dump.vcd
pause