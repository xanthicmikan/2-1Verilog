module d_latch_tb;
    reg d;
    reg en;
    reg rstn;
    reg [2:0] delay;
    reg [1:0] delay2;
    integer i;

    d_latch  d0 (.d (d),
                .en (en),
                .rstn (rstn),
                .q (q));

   initial begin
        $monitor ("[%0t] en=%0b d=%0b q=%0b", $time, en, d, q);

        // 1. Initialize testbench variables
        d <= 0;
        en <= 0;
        rstn <= 0;
	    
        // 2. Release reset
        #10 rstn <= 1;
	    
        // 3. Randomly change d and enable
        for (i = 0; i < 5; i=i+1) begin
            delay = $random;
            delay2 = $random;
            #(delay2) en <= ~en;
            #(delay) d <= i;
        end
   end

    initial begin
        $dumpfile("dump.vcd");
    	$dumpvars(2, d_latch_tb);
    end   
 
endmodule