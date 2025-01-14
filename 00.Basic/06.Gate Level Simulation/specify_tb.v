`timescale 1ns/1ns
module uut_tb;
    reg a;
    reg b;
    wire out;
	
    uut u0(
        .a(a),
        .b(b),
        .out(out)
	);
    initial begin
        {a, b} <= 0;
        #10 
        {a, b} <= 1;		
        #10 
        {a, b} <= 2;
        #10 
        {a, b} <= 3;		
        
        #50 $finish;
    end
	
	initial 
        $monitor ("T=%0t a=%0b b=%0b out=%0b", $time, a, b, out);	
		
	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, uut_tb);
	end  	
endmodule