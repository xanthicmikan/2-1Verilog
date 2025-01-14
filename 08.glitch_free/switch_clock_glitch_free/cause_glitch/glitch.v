module glitch(  
    input  clk0,      
    input  clk1,  
    input  select,  
    input  rst_n,  
    output clkout); 
	
    assign clkout = (clk1 & select) | (~select & clk0);
	
endmodule