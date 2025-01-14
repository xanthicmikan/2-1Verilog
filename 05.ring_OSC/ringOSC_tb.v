`timescale 1ns/1ns
module ringOSC_tb;

    reg en;
    wire ring_clk;
    
	initial begin
	    en <= 0;
		#10
	    en <= 1;
	    
		#100 $finish;
	end  
    
    ringOSC uut ( .en(en),
	              .osc_out(ring_clk));
    

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, ringOSC_tb);
	end  	
endmodule
