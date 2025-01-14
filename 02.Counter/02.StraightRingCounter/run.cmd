del wave
del wave.vcd
iverilog -o wave ringcounter.v ringcounter_tb.v
vvp wave
gtkwave dump.vcd
pause