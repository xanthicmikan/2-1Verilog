`timescale 1ns/1ns
module multix2 (
    input  clk,
    input  rst_n,
    output o_clk);

    reg clk_tmp;
  
    always@(posedge clk or negedge rst_n) begin
      if (!rst_n)
        clk_tmp <= 1'b0;
      else    
        clk_tmp <= #0 ~clk_tmp;
    end
	
	assign o_clk = (clk ^ ~clk_tmp);

endmodule