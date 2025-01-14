module sine_wave(
    input clk,
    input reset,
    output reg [7:0] sine);
	
    
    reg [7:0] sin_table [0:29];
	integer i;
	
    initial begin
	    i = 0;
        sin_table[0] = 0;
        sin_table[1] = 16;
        sin_table[2] = 31;
        sin_table[3] = 45;
        sin_table[4] = 58;
        sin_table[5] = 67;
        sin_table[6] = 74;
        sin_table[7] = 77;
        sin_table[8] = 77;
        sin_table[9] = 74;
        sin_table[10] = 67;
        sin_table[11] = 58;
        sin_table[12] = 45;
        sin_table[13] = 31;
        sin_table[14] = 16;
        sin_table[15] = 0;
        sin_table[16] = -16;
        sin_table[17] = -31;
        sin_table[18] = -45;
        sin_table[19] = -58;
        sin_table[20] = -67;
        sin_table[21] = -74;
        sin_table[22] = -77;
        sin_table[23] = -77;
        sin_table[24] = -74;
        sin_table[25] = -67;
        sin_table[26] = -58;
        sin_table[27] = -45;
        sin_table[28] = -31;
        sin_table[29] = -16;
    end
  

    always @(posedge clk) begin
 
        sine <= sin_table[i];
        i = i+ 1;
        if(i == 29)
            i = 0;		
    end
endmodule