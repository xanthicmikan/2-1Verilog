`timescale 1ns/1ns
module div2_tb;
    reg  clk;
    reg  rst_n;
    wire o_clk;
    
    div2 u0 (
      .clk(clk),
      .rst_n(rst_n),
      .o_clk(o_clk)
    );
    // 50MHz clk
    always #10 clk = ~clk;
    
    initial begin
	  {clk, rst_n} <= 0;

      #10 {clk, rst_n} <= 1;
	  #200 $finish;
    end
    
	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, div2_tb);
	end  	
endmodule