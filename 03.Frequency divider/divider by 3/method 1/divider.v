module div3 (
    input  clk,
    input  rst_n,
    output o_clk);
    
	parameter WIDTH = 3;
    parameter N = 3;

    reg [WIDTH:0] cnt;
	reg clk_p, clk_n;
	
	assign o_clk = clk_p | clk_n;

    always@(posedge clk or negedge rst_n) begin
      if (!rst_n)
        cnt <= 0;
      else if (cnt == (N-1))
        cnt <= 0;
      else
        cnt <= cnt + 1;
    end
     
    always@(posedge clk or negedge rst_n) begin
      if (!rst_n)
        clk_p <= 0;
      else if (cnt < (N/2))
        clk_p <= 0;
      else    
        clk_p <= 1;
    end

    always@(negedge clk or negedge rst_n) begin
      if (!rst_n)
        clk_n <= 0;
      else if (cnt < (N/2))
        clk_n <= 0;
      else    
        clk_n <= 1;
    end	

endmodule