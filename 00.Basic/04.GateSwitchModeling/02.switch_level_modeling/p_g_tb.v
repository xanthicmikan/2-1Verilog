module p_g_tb;
  wire vdd, gnd;

  p_g u0 (.vdd(vdd), .gnd(gnd));

  initial begin
  
    #10;
	#10;
    $monitor ("T=%0t vdd=%0b gnd=%0b", $time, vdd, gnd);

  end
endmodule