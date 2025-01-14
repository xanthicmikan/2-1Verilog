`timescale 1ns/1ns
module s2p_tb;

	reg clk;
	reg rst_n;
	reg en;
	reg si;
	wire [3:0] po;

	initial begin
	    en = 1'b0;
	    si = 1'b0;
	    #10;
	    si = 1'b1;
	    #20;
	    si = 1'b0;
	    #20;
	    si = 1'b1;
	    #20;
	    en = 1'b1;
	    si = 1'b0;
	    #20;
	    en = 1'b0;
	    si = 1'b0;
	end

	initial clk = 1'b0;
	always #10 clk = ~clk;

	initial begin
	    rst_n = 1'b0;
	    #5;
	    rst_n = 1'b1;
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(0, s2p_tb);
	    #200;
	    $finish;
	end

	s2p s2p_0 (
	    .clk(clk),
	    .rst_n(rst_n),
	    .en(en),
	    .si(si),
	    .po(po)
	);

endmodule