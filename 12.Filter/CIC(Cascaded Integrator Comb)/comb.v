module comb
    #(parameter NIN  = 21,
      parameter NOUT = 17)
    (
     input clk,
     input rstn,
     input en,
     input [NIN-1:0] din,
     input valid,
     output [NOUT-1:0] dout);


   reg [5:0] en_r ;
   always @(posedge clk or negedge rstn) begin
      if (!rstn) begin
         en_r <= 'b0 ;
      end
      else if (en) begin
         en_r <= {en_r[5:0], en} ;
      end

   end

   reg [NOUT-1:0] d1, d1_d, d2, d2_d, d3, d3_d ;
   always @(posedge clk or negedge rstn) begin
      if (!rstn)  d1 <= 'b0 ;
      else if (en) d1 <= din ;
   end
   always @(posedge clk or negedge rstn) begin
      if (!rstn)  d1_d <= 'b0 ;
      else if (en) d1_d <= d1 ;
   end
   wire [NOUT-1:0] s1_out = d1 - d1_d ;

   always @(posedge clk or negedge rstn) begin
      if (!rstn)  d2 <= 'b0 ;
      else if (en) d2 <= s1_out ;
   end
   always @(posedge clk or negedge rstn) begin
      if (!rstn)  d2_d <= 'b0 ;
      else if (en) d2_d <= d2 ;
   end
   wire [NOUT-1:0] s2_out = d2 - d2_d ;

   always @(posedge clk or negedge rstn) begin
      if (!rstn)  d3 <= 'b0 ;
      else if (en) d3 <= s2_out ;
   end
   always @(posedge clk or negedge rstn) begin
      if (!rstn)  d3_d <= 'b0 ;
      else if (en) d3_d <= d3 ;
   end
   wire [NOUT-1:0]s3_out = d3 - d3_d ;

   reg [NOUT-1:0]dout_r ;
   reg valid_r;
   always @(posedge clk or negedge rstn) begin
      if (!rstn) begin
         dout_r <= 'b0 ;
         valid_r <= 'b0 ;
      end
      else if (en) begin
         dout_r <= s3_out ;
         valid_r <= 1'b1 ;
      end
      else begin
         valid_r <= 1'b0 ;
      end
   end
   assign dout  = dout_r ;
   assign valid = valid_r ;

endmodule
