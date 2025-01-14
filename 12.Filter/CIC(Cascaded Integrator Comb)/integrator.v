//3 stages integrator
module integrator
    #(parameter NIN = 12,
      parameter NOUT = 21)
    (
      input clk ,
      input rstn ,
      input en ,
      input [NIN-1:0] din ,
      output valid ,
      output [NOUT-1:0] dout) ;

   reg [NOUT-1:0] int_d0;
   reg [NOUT-1:0] int_d1;
   reg [NOUT-1:0] int_d2;
   wire [NOUT-1:0] sxtx = {{(NOUT-NIN){1'b0}}, din};

   reg [2:0] en_r ;
   always @(posedge clk or negedge rstn) begin
      if (!rstn) begin
         en_r <= 'b0 ;
      end
      else begin
         en_r <= {en_r[1:0], en};
      end
   end

   always @(posedge clk or negedge rstn) begin
      if (!rstn) begin
         int_d0 <= 'b0 ;
      end
      else if (en) begin
         int_d0 <= int_d0 + sxtx ;
      end
   end

   always @(posedge clk or negedge rstn) begin
      if (!rstn) begin
         int_d1 <= 'b0 ;
      end
      else if (en_r[0]) begin
         int_d1 <= int_d1 + int_d0 ;
      end
   end

   always @(posedge clk or negedge rstn) begin
      if (!rstn) begin
         int_d2 <= 'b0 ;
      end
      else if (en_r[1]) begin
         int_d2 <= int_d2 + int_d1 ;
      end
   end

   assign dout  = int_d2 ;
   assign valid = en_r[2];

endmodule
