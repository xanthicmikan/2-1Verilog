module  decimation
    #(parameter NDEC = 21)
    (
     input clk,
     input rstn,
     input en,
     input [NDEC-1:0] din,
     output valid,
     output [NDEC-1:0] dout);

   reg  valid_r ;
   reg [2:0] cnt ;
   reg [NDEC-1:0] dout_r ;

   always @(posedge clk or negedge rstn) begin
      if (!rstn) begin
         cnt <= 3'b0;
      end
      else if (en) begin
         if (cnt==4) begin
            cnt <= 'b0 ;
         end
         else begin
            cnt <= cnt + 1'b1 ;
         end
      end
   end

   always @(posedge clk or negedge rstn) begin
      if (!rstn) begin
         valid_r <= 1'b0 ;
         dout_r <= 'b0 ;
      end
      else if (en) begin
         if (cnt==4) begin
            valid_r <= 1'b1 ;
            dout_r <= din;
         end
         else begin
            valid_r <= 1'b0 ;
         end
      end
   end

   assign dout = dout_r ;
   assign valid = valid_r ;

endmodule
