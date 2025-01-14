`timescale 1ns/1ns
module glitch_free_tb;  
    reg  clk0;    
    reg  clk1;  
    reg  select;  
    reg  rst_n; 
    wire clkout; 
	
	always #15 clk0 = ~clk0;
	always #10 clk1 = ~clk1;	
	
	initial begin
	    {clk0, clk1, select, rst_n} <= 0;
		
		#10 rst_n <= 1;
		#37 select <= 1;		
	    
		#100 $finish;
	end   
    
    glitch_free uut ( .clk0(clk0),
	                  .clk1(clk1),
					  .select(select),
					  .rst_n(rst_n),
					  .clkout(clkout));
    

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, glitch_free_tb);
	end  	
endmodule