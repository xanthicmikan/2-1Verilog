`timescale 1ns/1ns
module mod10_tb;
    reg clk;
    reg rstn;

    //output
    wire [3:0] out;

	mod10 u0 (
	    .clk(clk),
	    .rstn(rstn),
	    .q(out));
		
	always #10 clk = ~clk;

	initial begin
	clk = 0;
	rstn = 0;

	#10 rstn <= 1;
    #500 $finish;
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, mod10_tb);
	end  

endmodule