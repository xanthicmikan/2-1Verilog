module counter9_c2 (
   input clk,
   input rst_n,
   output [3:0] q
 );
 
	reg [3:0] p;
	 
	assign q = p;
	 
	always@(posedge clk or negedge rst_n) begin
	  if (!rst_n)
		p <= 0;
	  else if (p == 9)
		p <= 0;
	  else
		p <= p + 1;
	end
 
endmodule