`timescale 1ns/1ns

module updowncon_tb;
 reg clk;
 reg rst_n;
 reg mode;// mode=1 up; mode=0 down
 wire [3:0]number;
 wire zero;// when number = 0, zero =1

 initial begin
	rst_n = 0;
	clk = 0;
	mode = 0;	
	#5  rst_n <= 1; 
	#5  mode <= 0;
	#50 mode <= 1;
	#40 $finish;
 end

 always #1 clk = ~clk;

 updowncon u0(
	.clk(clk),
	.rst_n(rst_n),
	.mode(mode),
	.number(number),
	.zero(zero)
 );
 
 initial begin
	$dumpfile("dump.vcd");
	$dumpvars(2, updowncon_tb);
 end  
 

endmodule 