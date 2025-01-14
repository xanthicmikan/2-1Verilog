`timescale 1ns/1ns
module delay_sample_tb;  
    reg        clka;     
    reg [31:0] din;
    reg        din_en;
    reg        rstn;
    reg        clkb;
    wire[31:0] dout;
    wire       dout_en;

    integer i;
	
	always #25 clka = ~clka;//show clock
	always #5 clkb = ~clkb;//target fast clock	
	
	initial begin
	    {clka, clkb, rstn, din_en} <= 0;
        din <= 32'h0;		
		
		#5 rstn <= 1;		
		#20 din_en <= 1;
		    din <= 32'h55667788; 
		#50 din_en <= 0;
		    din <= 32'h5566740d;
		#50 din_en <= 1;
		    din <= 32'h5566b72e;
		#50 din_en <= 0;
		    din <= 32'h55663d70;
		#50 din_en <= 1;
		    din <= 32'h5566fa4f;
		#50 din_en <= 0;
		    din <= 32'h55668091;			
		#50 din_en <= 1;
		    din <= 32'h556614ae;
		#50 din_en <= 0;
		    din <= 32'h556689a4;			
	    
		#200 $finish;
	end   
    
    delay_sample uut( .clka(clka),
	                  .clkb(clkb),
					  .rstn(rstn),
					  .din(din),
					  .din_en(din_en),					  
					  .dout(dout),
					  .dout_en(dout_en));
    

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, delay_sample_tb);
	end  	
endmodule