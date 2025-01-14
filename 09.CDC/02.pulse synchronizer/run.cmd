del wave
del wave.vcd
iverilog -o wave pulse_sync.v pulse_sync_tb.v
vvp wave
gtkwave dump.vcd
pause