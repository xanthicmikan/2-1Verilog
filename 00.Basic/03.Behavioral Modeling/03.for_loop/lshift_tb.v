`timescale 1ns/1ns
module lshift_tb;

    reg clk;
    reg rstn;	
    reg [7:0] load_val;
    reg load_en;	
	
    //output
    wire [7:0] out;

	lshift u0 (
	       .clk(clk),
	       .rstn(rstn),
	       .load_val(load_val),
	       .load_en(load_en),				
	       .out(out));
					
	always #10 clk = ~clk;

	initial begin
	    clk <= 0;
	    rstn <= 0;
	    load_en <= 0;
	    load_val <= 8'h01;
	end

   initial begin

        #20 rstn <= 1;
        repeat (7) @ (posedge clk)
        load_en <= 1;
        repeat (7) @ (posedge clk)
        load_en <= 0;
	    
        #20 $finish;
   end	

	initial begin		
		$monitor("T=%0t, out=%b", $time, out);
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, lshift_tb);
	end  

endmodule