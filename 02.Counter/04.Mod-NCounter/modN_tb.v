`timescale 1ns/1ns
module modN_ctr_tb;
    parameter N = 10;
    parameter WIDTH = 4;
	
    reg clk;
    reg rstn;
    //output
    wire [WIDTH-1:0] out;

	modN_ctr u0 (
	    .clk(clk),
	    .rstn(rstn),
	    .out(out));
	always #10 clk = ~clk;

	initial begin
        {clk, rstn} <= 0;
		
		$monitor("T=%0t, out=0x%0h", $time, out);
        repeat(2) @(posedge clk);
        rstn <= 1;		
        
		repeat(20) @(posedge clk);
        $finish;
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, modN_ctr_tb);
	end  

endmodule