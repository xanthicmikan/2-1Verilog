module ripple_tb;
    reg clk;
    reg rstn;
    wire [3:0] out;
 
    ripple r0(.rstn(rstn),
              .clk(clk),
              .out(out));

    always #5 clk = ~clk;
 
    initial begin
        rstn <= 0;
        clk <= 0;
        
        repeat (4) @(posedge clk);
        rstn <= 1;
        
        repeat (25) @(posedge clk);
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, ripple_tb);
    end  

endmodule 