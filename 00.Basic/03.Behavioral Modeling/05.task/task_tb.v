/*
// 1.
task [name];
	input  [port_list];
	inout  [port_list];
	output [port_list];
	begin
		[statements]
	end
endtask

// 2.
task [name] (input [port_list], inout [port_list], output [port_list]);
	begin
		[statements]
	end
endtask

// 3.Empty port list
task [name] ();
	begin
		[statements]
	end
endtask

// static v.s. automatic
  // This is a static task
  task display();
    integer i = 0;
    i = i + 1;
    $display("i=%0d", i);
  endtask
  // This is now automatic
  task automatic display();
    integer i = 0;
    i = i + 1;
    $display("i=%0d", i);
  endtask  
*/
module tb;
	uut u0();

	initial begin
		u0.display();  
	end
endmodule

module uut;
	initial begin
		display();
	end

	task display();
		$display("Hello World");
	endtask
endmodule