`timescale 1ns/1ns
module A;
	task display();
		$display("This is A");
	endtask
endmodule

module B;
	initial begin : B_INITIAL
		#10;
		begin : B_INITIAL_BLOCK
			reg b_signal;
            #10 $display("This is B, b_signal=%0d", b_signal);
		end
	end
	
    function [3:0] min;
	    input [3:0] a, b;
        begin
		    if( a < b)
		      min = a;
			else
			  min = b;
        end		
    endfunction	
endmodule

module hiera_tb;
    
	A uA();
	B uB();
	reg [3:0] result;

	initial begin : TB_INITIAL
		reg signal;
        #10 $display("This is TB, b_signal=%0d", signal);
	end

  	initial begin
  	  TB_INITIAL.signal = 0;
      uA.display();
      #10 result = uB.min(4'd7, 4'd5);
	  $display("This is TB, min result=%0d", result);
      uB.B_INITIAL.B_INITIAL_BLOCK.b_signal= 1;
    end
	
endmodule