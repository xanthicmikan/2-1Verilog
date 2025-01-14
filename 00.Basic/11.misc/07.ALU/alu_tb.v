`timescale 1ns/1ns
module alu_tb;

    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] op;
    wire [7:0] y;

    // Instantiate the LIFO module
    alu uut (
        .a(a),
        .b(b),
        .op(op),
        .y(y)
    );

    initial begin
      a = 8'h04;
      b = 8'h07;
      op = 3'b000;

    end


    always #50 op = op + 1;

    initial begin
      $monitor("[%0t] Op=%d a=%d b=%d y=%d", $time, op, a, b, y);
    end

    initial #1000 $finish;


    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, alu_tb);
    end	
endmodule