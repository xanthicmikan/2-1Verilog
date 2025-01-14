module tb;
  reg clk;
  reg rst_n;
  wire [3:0] q;
 
  counter9_c2 cont( .clk(clk), .rst_n(rst_n), .q(q));   
  
  initial begin
   clk = 0;
   forever
   #1 clk = ~clk;
  end  
  
  initial begin
   rst_n = 0;
   #2;
   rst_n = 1;
   #30;
   $finish(0);
  end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(2, tb);
end    
  
endmodule

