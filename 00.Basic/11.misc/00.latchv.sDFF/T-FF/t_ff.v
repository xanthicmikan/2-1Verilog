//CLK  T  Qnext
//-------------------------
// ↑   0  Q (Hold)
// ↓   0  Q (Hold)
// ↑   1  Q'(Toggle)
// ↓   1  Q (No Change)
//-------------------------
module t_ff(
    input t,
    input rstn,
    input clk,
    output reg q);

    always @(posedge clk) begin
        if(!rstn)
    	    q <= 0;
    	else
    	    if(t)
    	        q <= ~q;
    	    else
    	        q <= q;
    		
    end

endmodule