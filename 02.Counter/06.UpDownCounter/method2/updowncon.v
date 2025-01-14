module updowncon(
 input clk,
 input rst_n,
 input mode,// mode=1 up; mode=0 down
 output reg [3:0]number,
 output reg zero// when number = 0, zero =1
 );
 
  reg [3:0] num;
  
  always @(posedge clk or negedge rst_n)begin
    if(~rst_n)
	   num <= 0;
	else
	   if(mode)
	    num <= num == 9 ? 0 :num + 1'b1;
	   else
 	    num <= num == 0 ? 9 :num - 1'b1; 
  end
  
  always @(posedge clk or negedge rst_n)begin
    if(~rst_n)
	   number <= 0;
	else
 	   number <= num; 
  end

  always @(posedge clk or negedge rst_n)begin
    if(~rst_n)
	   zero <= 0;
	else
 	   zero <= num == 0; 
  end  
  
endmodule