module div3 (
    input  clk,
    input  rst_n,
    output o_clk);

    parameter [3:0] div = 4'd2;//div - 1;

    wire sAll, sHlf;
    reg [3:0] cnt;
	reg clk_p, itExt;
	
	assign sAll = div[3:0] == cnt[3:0];
	assign sHlf = div[3:1] == cnt[3:0];
	assign o_clk = clk_p | itExt;

    always@(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
          cnt <= 0;
	      clk_p <= 0;
		end
        else begin
          cnt <= sAll ? 1'b0 : (cnt+1);
	      clk_p <= sAll ? 1'b0 : (sHlf ? 1'b1 : clk_p);
	    end
    end
     


    always@(negedge clk or negedge rst_n) begin
        if (!rst_n)
          itExt <= 0;
        else    
          itExt <= &{clk_p, ~div[0]};
    end	

endmodule