/*
while (expression) begin
	[statements]
end
*/
module my_top;
  	integer i = 5;

	initial begin
      while (i > 0) begin
        $display ("i# %0d", i);
        i = i - 1;
      end
	end
endmodule