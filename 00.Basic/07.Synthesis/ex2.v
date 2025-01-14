module cntr_mod3 (
   input clk, rstn, 
   output reg [1:0] out);
   
    always @(posedge clk) begin
    if (!rstn)
        out <= 0;
    else
	    if(out == 3)
		    out <= 0;
		else
            out <= out + 1;
    end
endmodule