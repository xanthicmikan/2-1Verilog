module sine_wave_tb;
    reg clk;
    reg reset; 
    wire [7:0] sine;
    
    sine_wave u0(.clk(clk),
                 .reset(reset),
    		     .sine(sine));
    
	always #10 clk = ~clk;
	
    initial begin
        {clk, reset} <= 0;
        #10 reset <= 1;
		
		#10000 $finish();
    end
    
	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, sine_wave_tb);
	end   
endmodule