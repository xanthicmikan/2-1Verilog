module div25 (
    input  clk,
    input  rst_n,
    output o_clk);
    
	parameter WIDTH = 3;
    parameter N = 5;// 2.5x2

    reg [WIDTH:0] cnt;
	reg clk_p, clk_n;
	
	assign o_clk = clk_p | clk_n;

    always@(posedge clk or negedge rst_n) begin
      if (!rst_n)
        cnt <= 'b0;
      else if(cnt == N-1)
        cnt <= 'b0;		
      else
        cnt <= cnt + 1;
    end
     
    always@(posedge clk or negedge rst_n) begin
      if (!rst_n)
        clk_p <= 1'b0;
      else if (cnt == 0)
        clk_p <= 1;		
      else if (cnt == (N/2)+1)
        clk_p <= 1;
      else    
        clk_p <= 0;
    end

    always@(negedge clk or negedge rst_n) begin
      if (!rst_n)
        clk_n <= 1'b0;
      else if (cnt == 1)
        clk_n <= 1;		
      else if (cnt == (N/2)+1)
        clk_n <= 1;
      else    
        clk_n <= 0;
    end	

endmodule