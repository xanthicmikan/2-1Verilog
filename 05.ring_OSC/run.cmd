del wave
del wave.vcd
iverilog -o wave ringOSC.v ringOSC_tb.v
vvp wave
gtkwave dump.vcd
pause