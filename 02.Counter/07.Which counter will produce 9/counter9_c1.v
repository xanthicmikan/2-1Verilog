module counter9_c1 (
    input clk,
    input rst_n,
    output reg [3:0] q);

	reg [3:0] p;

	always@(posedge clk or negedge rst_n) begin
	    if (!rst_n)
		    p <= 0;
	    else
		    p <= p + 1;
	end

	always@(p) begin
	    if (p == 9)
		    q = 0;
	    else
		    q = p;
	end
endmodule