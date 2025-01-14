module bitshift_reg
  #(parameter MSB = 8)
  (
    input clk,
    input rstn,	
    input en,
    input dir,	
    input d,
    output reg [MSB-1:0] out
  );
    
	always@(posedge clk) begin
	    if (!rstn)
		    out <= 0;	
	    else begin
		    if(en)
			    case(dir)
				    0: out <={out[MSB-2:0], d};
				    1: out <={d, out[MSB-1:1]};
                endcase					
			else
			    out <= out;
	    end
	end
	
endmodule