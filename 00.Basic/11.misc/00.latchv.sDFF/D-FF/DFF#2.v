//With sync active-low reset
module dff 	( input d,
              input rstn,
              input clk,
              output reg q);

	always @ (posedge clk)
        if (!rstn)
            q <= 0;
        else
            q <= d;
endmodule