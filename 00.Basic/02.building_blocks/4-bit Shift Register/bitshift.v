module bitshift
  (
    input clk,
    input rstn,		
    input d,
    output reg [3:0] out
  );
    
	always@(posedge clk) begin
	    if (!rstn)
		    out <= 0;	
	    else begin
		    out <={out[2:0], d};
	    end
	end
	
endmodule