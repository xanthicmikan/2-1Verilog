del wave
del wave.vcd
iverilog -o wave asyncFIFO.v dualram.v sync_r2w.v sync_w2r.v rptr_empty.v wptr_full.v asyncFIFO_tb.v
vvp wave
gtkwave dump.vcd
pause