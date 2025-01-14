`timescale 1ns/1ns
module glitch_free_tb;  
    reg  clk;      
    reg  rst_n;
    reg  data;	
    wire out; 
	
	always #10 clk = ~clk;	
	
	initial begin
	    {clk, rst_n, data} <= 0;	
		
		#10 rst_n <= 1;		
		#10 data <= 1;	
		#12 data <= 0;	
		#16 data <= 0;	
	    
		#100 $finish;
	end   
    
    glitch_free uut ( .clk(clk),
					  .rst_n(rst_n),
					  .data(data),					  
					  .out(out));
    

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, glitch_free_tb);
	end  	
endmodule