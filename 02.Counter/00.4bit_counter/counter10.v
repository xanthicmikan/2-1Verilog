module counter10 (
    input            clk,
    input            clr,
    input            load,
    input            en,
    input      [3:0] data,
    output reg [3:0] q,
    output reg       cout);

	always@(posedge clk) begin
	    if (clr == 1'b1)
	        q <= 0;
	    else if (load == 1'b1)
	        q <= data;
	    else if (en == 1'b1) begin
	        if (q == 9)
	            q <= 0;
	        else
	            q <= q + 1;
	    end
	end

	always@(q) begin
	    if (q == 9)
		    cout = 1;
	    else
		    cout = 0;
	end

endmodule