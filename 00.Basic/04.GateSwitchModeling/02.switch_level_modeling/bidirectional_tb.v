module bidirectional_tb;
  reg io1, ctrl;
  wire io2, io2_0, io2_1;

  bidirectional u0 (.io1(io1), .ctrl(ctrl), .io2(io2), .io2_0(io2_0), .io2_1(io2_1));

  initial begin
    {io1, ctrl} <= 0;

    $monitor ("T=%0t io1=%0b ctrl=%0b io2=%0b io2_0=%0b io2_1=%0b", 
	           $time, io1, ctrl, io2, io2_0, io2_1);

    #10 io1  <= 1;
    #10 ctrl <= 1;
    #10 ctrl <= 0;
    #10 io1  <= 0;

  end
endmodule