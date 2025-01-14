module lshift
  (
    input clk,
    input rstn,	
    input [7:0] load_val,
    input load_en,
    output reg [7:0] out
  );
    integer i;
    
	always@(posedge clk) begin
	    if (!rstn)
		    out <= 0;	
	    else begin
		    if(load_en)
			    out <= load_val;				
			else begin
                for (i = 0; i < 8; i = i + 1) begin
                    out[i+1] <= out[i];
                end
                out[0] <= out[7];
			end
	    end
	end
	
endmodule