module counter_tb;
    reg clk;
    reg rstn;
    wire [3:0] out; 
    
    counter c0(.clk(clk),
               .rstn(rstn),
               .out(out));

    always #5 clk = ~clk;
 
    initial begin
        clk <= 0;
        rstn <= 0;   
        
        #20 rstn <= 1;
        #160 rstn <= 0;//if set #80, counter 8 and then reset 0
        #50 rstn <= 1;
        
        #20 $finish;   
    end
 
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, counter_tb);
    end  

endmodule