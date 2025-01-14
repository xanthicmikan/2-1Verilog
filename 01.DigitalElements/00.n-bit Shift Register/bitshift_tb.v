`timescale 1ns/1ns
module bitshift_reg_tb;
    parameter MSB = 16;
	
    reg clk;
    reg rstn;	
    reg en;
    reg dir;	
    reg d;
	
    //output
    wire [MSB-1:0] out;

	bitshift_reg #(MSB) u0 (
	                .clk(clk),
	                .rstn(rstn),
	                .en(en),
	                .dir(dir),
	                .d(d),					
	                .out(out));
	always #10 clk = ~clk;

	initial begin
	    clk <= 0;
	    en <= 0;
	    dir <= 0;
	    rstn <= 0;
	    d <= 'h1;
	end

   initial begin

        // 1. Apply reset and deassert reset after 20 ns
        rstn <= 0;
        #20 rstn <= 1;
            en <= 1;
	    
	    // 2. For 7 clocks, drive alternate values to data pin
        repeat (7) @ (posedge clk)
            d <= ~d;
	    
        // 3. Alternate shift direction
		#10 dir <= 1;
        repeat (7) @ (posedge clk)
            d <= ~d;
	    
        // 4. Drive nothing for next 7 clocks
        repeat (7) @ (posedge clk);
	    
        // 5. Finish the simulation
        $finish;
   end	

	initial begin		
		$monitor("T=%0t, rstn=%0b d=%b, en=%0b, dir=%0b, out=%b", $time, rstn, d, en, dir, out);
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, bitshift_reg_tb);
	end  

endmodule