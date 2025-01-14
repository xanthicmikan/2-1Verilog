module uut_tb;
    reg [7:0] d1; 
    reg [7:0] d2; 
    
    reg  d3 [3:0];
    reg  d4 [3:0];
    reg  [3:0] d5;	
    integer  i, j, z;
	
    initial begin
        d1 = 8'd45;
        d2 = 8'd9;		
    
	    //arithmetic operators
        $display ("Add + = %d", d1 + d2);
        $display ("Sub - = %d", d1 - d2);
        $display ("Mul * = %d", d1 * d2);
        $display ("Div / = %d", d1 / d2);
        $display ("Mod %% = %d", d1 % d2);
        $display ("Pow ** = %d", d2 ** 2);

        //Equality operators
        d1 = 45;     d2 = 9;      
		$display ("Result for d1(%0d) === d2(%0d) : %0d", d1, d2, d1 === d2);
        d1 = 'b101x; d2 = 'b1011; 
		$display ("Result for d1(%0b) === d2(%0b) : %0d", d1, d2, d1 === d2);
        d1 = 'b101x; d2 = 'b101x; 
		$display ("Result for d1(%0b) === d2(%0b) : %0d", d1, d2, d1 === d2);
        d1 = 'b101z; d2 = 'b1z00; 
		$display ("Result for d1(%0b) !== d2(%0b) : %0d", d1, d2, d1 !== d2);
        d1 = 39;     d2 = 39;     
		$display ("Result for d1(%0d) == d2(%0d) : %0d", d1, d2, d1 == d2);
        d1 = 14;     d2 = 14;     
		$display ("Result for d1(%0d) != d2(%0d) : %0d", d1, d2, d1 != d2);    	
		
		//logical operators
        d1 = 45;     d2 = 9; 
		$display ("Result of d1(%0d) && d2(%0d) : %0d", d1, d2, d1 && d2);
        d1 = 0;      d2 = 4; 
		$display ("Result of d1(%0d) && d2(%0d) : %0d", d1, d2, d1 && d2);
        d1 = 'dx;    d2 = 3; 
		$display ("Result of d1(%0d) && d2(%0d) : %0d", d1, d2, d1 && d2);
        d1 = 'b101z; d2 = 5; 
		$display ("Result of d1(%0d) && d2(%0d) : %0d", d1, d2, d1 && d2);
        d1 = 45;     d2 = 9; 
		$display ("Result of d1(%0d) || d2(%0d) : %0d", d1, d2, d1 || d2);
        d1 = 0;      d2 = 4; 
		$display ("Result of d1(%0d) || d2(%0d) : %0d", d1, d2, d1 || d2);
        d1 = 'dx;    d2 = 3; 
		$display ("Result of d1(%0d) || d2(%0d) : %0d", d1, d2, d1 || d2);
        d1 = 'b101z; d2 = 5; 
		$display ("Result of d1(%0d) || d2(%0d) : %0d", d1, d2, d1 || d2);
        d1 = 4;                 
		$display ("Result of !d1(%0d) : %0d", d1, !d1);
        d1 = 0;                 
		$display ("Result of !d1(%0d) : %0d", d1, !d1);		
		
		//bitwise operators	
        d3[0] = 0;  d4[0] = 0;
        d3[1] = 1;  d4[1] = 1;
        d3[2] = 'x; d4[2] = 'x;
        d3[3] = 'z; d4[3] = 'z;
	    
        for (i = 0; i < 4; i += 1) begin
          for (j = 0; j < 4; j += 1) begin
            $display ("d3(%0d) & d4(%0d) = %0d", d3[i], d4[j], d3[i] & d4[j]);
          end
        end		
		
		//shift operators
        d5 = 4'h1;
        $display ("Original data = 'b%0b", d5);
        for (z = 0; z < 4; z +=1 ) begin
          $display ("data << %0d = 'b%b", z, d5 << z);
        end
	    
        d5 = 4'h8;
        $display ("Original data = 'b%0b", d5);
        for (z = 0; z < 4; z +=1 ) begin
          $display ("data >> %0d = 'b%b", z, d5 >> z);
        end		
		
		
        #20 $finish;		
    end
  

endmodule