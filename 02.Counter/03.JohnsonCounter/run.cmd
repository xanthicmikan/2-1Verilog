del wave
del wave.vcd
iverilog -o wave Johnsoncounter.v Johnsoncounter_tb.v
vvp wave
gtkwave dump.vcd
pause