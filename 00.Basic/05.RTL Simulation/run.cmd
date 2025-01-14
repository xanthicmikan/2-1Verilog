del wave
del wave.vcd
iverilog -o wave clk_gen.v clk_gen_tb.v
vvp wave
gtkwave dump.vcd
pause