`timescale 1ns/1ns
module delay_2ff_tb;  
    reg  clka;     
    reg  d;  
    reg  rstn;
    reg  clkb;
	wire out;
		 
	always #10 clka = ~clka;//show clock
	always #5 clkb = ~clkb;//target fast clock	
	
	initial begin
	    {clka, clkb, rstn, d} <= 0;	
		
		#20 rstn <= 1;		
		#30 d <= 1;	
		#20 d <= 0;	

	    
		#200 $finish;
	end   
    
    delay_2ff uut ( .clka(clka),
	                .clkb(clkb),
					.rstn(rstn),
					.d(d),					  
					.out(out));
    

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, delay_2ff_tb);
	end  	
endmodule