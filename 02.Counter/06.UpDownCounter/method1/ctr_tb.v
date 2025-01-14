`timescale 1ns/1ns

module ctr_tb;
 reg clk;
 reg rst_n;
 reg up_down;// mode=1 up; mode=0 down
 wire [2:0]out;

 initial begin
	rst_n = 0;
	clk = 0;
	up_down = 0;	
	#5  rst_n <= 1; 
	#5  up_down <= 0;
	#50 up_down <= 1;
	#40 $finish;
 end

 always #1 clk = ~clk;

 ctr c0(
	.up_down(up_down),
	.clk(clk),
	.rstn(rst_n),
	.out(out)
 );
 
 initial begin
	$dumpfile("dump.vcd");
	$dumpvars(2, ctr_tb);
 end  
 

endmodule 