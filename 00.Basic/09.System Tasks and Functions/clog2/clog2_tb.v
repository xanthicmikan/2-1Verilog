`define NUM_UNITS 5

module clog_tb;
  integer i;
  reg [`NUM_UNITS-1:0] 	active_unit;

  clog #(.NUM_UNITS(`NUM_UNITS)) u0(active_unit);

  initial begin
    active_unit     = 2;
	#10 active_unit = 8;//Over
    #10 active_unit = 6;
    $display("log2(8)=%d, log2(7)=%d, log2(6)=%d, log2(5)=%d ", $clog2(8), $clog2(7), $clog2(6), $clog2(5));
  end
endmodule