`timescale 1ns/1ns
module mos_tb;
    
    reg d, ctrl, nctrl, pctrl;
    wire outn, outp, outc;
    
    level_model u0 (.d(d), 
	.ctrl(ctrl),
	.nctrl(nctrl), 
	.pctrl(pctrl), 	
	.outn(outn), 
	.outp(outp),
    .outc(outc));
    
    initial begin
        {d, ctrl, nctrl, pctrl} <= 0;
        
        $monitor ("T=%0t d=%0b ctrl=%0b nctrl=%0b pctrl=%0b outn=%0b outp=%0b outc=%0b", 
		           $time, d, ctrl, nctrl, pctrl, outn, outp, outc);
        
        #10 d <= 1;
        #10 ctrl <= 1;
        #10 nctrl <= 1;
        #10 pctrl <= 1;
        #10 ctrl <= 0;		
        #10 nctrl <= 0;
        #10 pctrl <= 0;		
        #10 d <= 0;
    end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, mos_tb);
	end  

endmodule