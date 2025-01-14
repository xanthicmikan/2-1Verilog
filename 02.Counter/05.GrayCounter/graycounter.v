module gray_ctr
  #(parameter WIDTH = 4)
  (
    input clk,
    input rstn,
    output reg [WIDTH-1:0] out
  );
    
	reg [WIDTH-1:0] q;
	
	always@(posedge clk) begin
	    if (!rstn) begin
	        q <= 0;
		    out <= 0;	
		end
	    else begin
		    q <= q +1;
			out <= {q[WIDTH-1], q[WIDTH-1:1]^q[WIDTH-2:0]};
	    end
	end
	
endmodule