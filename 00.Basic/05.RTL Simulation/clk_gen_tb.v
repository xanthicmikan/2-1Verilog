`timescale 1ns/1ps
module clock_gen_tb;
    wire clk1;
    wire clk2;
    wire clk3;
    wire clk4;
    reg  enable;
    reg [7:0] dly;
	
	integer i;
    
    clock_gen u0(enable, clk1);
    clock_gen #(.FREQ(200000)) u1(enable, clk2);
    clock_gen #(.FREQ(400000)) u2(enable, clk3);
    clock_gen #(.FREQ(800000)) u3(enable, clk4);
    
    initial begin
        enable <= 0;
        
        for (i = 0; i < 10; i= i+1) begin
          dly = $random;
          #(dly) enable <= ~enable;
          $display("i=%0d dly=%0d", i, dly);
          #50;
        end
        
        #50 $finish;
    end
	
	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, clock_gen_tb);
	end  	
endmodule