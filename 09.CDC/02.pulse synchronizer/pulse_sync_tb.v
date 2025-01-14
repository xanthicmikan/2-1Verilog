`timescale 1ns/1ps
module pulse_syn_test ;
    reg  clk_100mhz, clk_25mhz ;
    reg  rstn ;
    reg  [7:0] cnt ;
    reg  pulse_sig ;
    wire pulse_slow;
    
    initial begin
        clk_100mhz = 0 ;
        clk_25mhz  = 0 ;
        rstn = 0 ;
        #11 rstn = 1 ;
    end
	
    always #(10/2) clk_100mhz = ~clk_100mhz ;
    always #(45/2) clk_25mhz  = ~clk_25mhz ;
    
    always @(posedge clk_100mhz or negedge rstn) begin
        if (!rstn) begin
            cnt <= 'b0 ;
        end
        else begin
            cnt <= cnt + 1'b1 ;
        end
    end
    
    always @(posedge clk_100mhz or negedge rstn) begin
       if (!rstn) begin
            pulse_sig <= 1'b0 ;
       end
       else if (cnt == 5 ||
                cnt == 40 || cnt == 42 ||
                cnt >= 75 && cnt <= 81 || cnt == 85 || cnt == 87 )
       begin
            pulse_sig <= 1'b1 ;
       end
       else begin
            pulse_sig <= 1'b0 ;
       end
    end
    
    pulse_syn u0(
        .rstn(rstn),
        .clk_fast(clk_100mhz),
        .pulse_fast(pulse_sig),
        .clk_slow(clk_25mhz),
        .pulse_slow(pulse_slow));
    
    initial begin
        forever begin
            #100;
            if ($time >= 10000)  $finish ;
        end
    end
    
	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, pulse_syn_test);
	end 	
endmodule