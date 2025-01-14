/*
// 1.
function [automatic] [return_type] name ([port_list]);
	[statements]
endfunction
// 1-1
function [7:0] sum;
	input [7:0] a, b;
	begin
		sum = a + b;
	end
endfunction
// 1-2
function [7:0] sum (input [7:0] a, b);
	begin
		sum = a + b;
	end
endfunction
*/
module tb;
    reg [31:0] results;
    initial begin
        #5 results = factorial(4);
        $display("factorial(4) = %0d", results);
    end

    //Functions that call itself are called recursive functions
	function automatic integer factorial;
	    input integer     data ;
        begin
            factorial = (data>=2)? data * factorial(data-1) : 1 ;
        end

	endfunction
endmodule