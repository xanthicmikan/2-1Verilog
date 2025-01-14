`timescale 1ns/1ns
module alu74181_tb;

    reg [3:0] a, b, s;
    reg cn, m;
    wire [3:0]f;
    wire cn4, equal, p, g;

    // Instantiate the LIFO module
    alu74181 uut (
        .a(a),
        .b(b),
        .s(s),
        .cn(cn),
        .m(m),
        .f(f),
        .cn4(cn4),
        .equal(equal),
        .p(p),
        .g(g)
    );

//only test cn/m =0;
    initial begin
      a = 8'h04;
      b = 8'h07;
      s = 4'b0000;
      cn = 1'b0;
      m = 1'b0;
    end


    always #50 s = s + 1;

    initial begin
      $monitor("[%0t] s=%d a=%d b=%d cn=%d m=%d f=%d", $time, s, a, b, cn, m, f);
    end

    initial #1000 $finish;


    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, alu74181_tb);
    end	
endmodule