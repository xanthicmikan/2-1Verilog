module mod10 (
    input            clk,
    input            rstn,
    output reg [3:0] q);

	always@(posedge clk) begin
	    if (!rstn)
	        q <= 0;
	    else begin
	        if (q == 9)
	            q <= 0;
	        else
	            q <= q + 1;
	    end
	end

endmodule