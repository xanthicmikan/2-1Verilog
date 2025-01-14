module mux_4_1(
  input S0, S1,
  input I0, I1, I2, I3,
  output Y);
  
  wire Y0, Y1;
  
  mux_2_1 m1(S0, I0, I1, Y0);
  mux_2_1 m2(S0, I2, I3, Y1);
  mux_2_1 m3(S1, Y0, Y1, Y);
endmodule

module mux_2_1(s, a, b, out);
   input a,b,s;
   output out;   

   assign out = s ? b : a;
    
endmodule