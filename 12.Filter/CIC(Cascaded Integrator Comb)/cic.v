module cic
    #(parameter NIN  = 12,
      parameter NMAX = 21,
      parameter NOUT = 17)
    (
     input clk,
     input rstn,
     input en,
     input [NIN-1:0] din,
     input valid,
     output [NOUT-1:0] dout);

   wire [NMAX-1:0] itg_out ;
   wire [NMAX-1:0] dec_out ;
   wire [1:0] en_r ;

   integrator #(.NIN(NIN), .NOUT(NMAX))
   u_integrator (
       .clk  (clk),
       .rstn (rstn),
       .en   (en),
       .din  (din),
       .valid(en_r[0]),
       .dout (itg_out));

   decimation #(.NDEC(NMAX))
   u_decimator (
       .clk  (clk),
       .rstn (rstn),
       .en   (en_r[0]),
       .din  (itg_out),
       .dout (dec_out),
       .valid(en_r[1]));

   comb #(.NIN(NMAX), .NOUT(NOUT))
   u_comb (
       .clk  (clk),
       .rstn (rstn),
       .en   (en_r[1]),
       .din  (dec_out),
       .valid(valid),
       .dout (dout));

endmodule
