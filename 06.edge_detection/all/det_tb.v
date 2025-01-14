`timescale 1ns/1ns
module det_tb;
    reg clk;
    reg rstn;
    reg d;	
    wire p_edge;
    wire n_edge;
    wire d_edge;	
 
    det u0(.rstn(rstn),
            .clk(clk),
			.d(d),
            .p_edge(p_edge),
            .n_edge(n_edge),
            .d_edge(d_edge));

    always #5 clk = ~clk;
 
    initial begin
        {rstn, clk, d} <= 0;
		
        #5 rstn <= 1;
		#15 d <= 1;
		#20 d <= 0;
		#15 d <= 1;
		#10 d <= 0;
		#20 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, det_tb);
    end  

endmodule 