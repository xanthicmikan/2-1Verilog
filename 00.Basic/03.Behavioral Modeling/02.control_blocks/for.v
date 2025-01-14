/*
for ( initial_assignment; condition; increment_variable) begin
	[statements]
end
*/
module my_top;
  	integer i = 5;

	initial begin
      for (i = 0; i < 5; i = i + 1) begin
        $display ("Loop #%0d", i);
      end
    end
endmodule