`timescale 1ns/10ps
module counter10_tb;
    reg clk;
    reg clr;
    reg load;
    reg en;
    reg [3:0] data;
    //output
    wire [3:0] q;
    wire       cout;

	counter10 u0 (
	    .clk(clk),
	    .clr(clr),
	    .load(load),
	    .en(en),
	    .data(data),
	    .q(q),
	    .cout(cout));

	initial begin
	clk = 0;
	clr = 0;
	load = 1;
	en = 1;
	data = 4'd0; 
	end

	always #5 clk = ~clk;

	initial begin
	#10 load = 1'b0;
	#40 load = 1'b1;
	#50 load = 1'b0;
	#30 clr  = 1'b1;
	#40 clr  = 1'b0;
	#200 en   = 1'b0;
    #20 $finish;
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, counter10_tb);
	end  

endmodule