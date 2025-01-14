del wave
del wave.vcd
iverilog -o wave mux_4_1.v mux_4_1_tb.v
vvp wave
gtkwave dump.vcd
pause