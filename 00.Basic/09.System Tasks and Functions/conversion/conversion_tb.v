module conversion_tb;
    reg [63:0] bit_pattern; 
    real real_value;
    integer int_value;
    
    initial begin

        bit_pattern = 64'h4055480000000000; // Represents 85.125 in IEEE 754 double precision format
    
        // Convert bit pattern to real
        real_value = $bitstoreal(bit_pattern);
        $display("Bit Pattern to Real: %f", real_value); // Outputs: Bit Pattern to Real: 5.000000
    
        // Convert integer to real
        int_value = 10;
        real_value = $itor(int_value);
        $display("Integer to Real: %f", real_value); // Outputs: Integer to Real: 10.000000
    
        // Convert real to bits
        bit_pattern = $realtobits(real_value);
        $display("Real to Bit Pattern: 0x%0h", bit_pattern); // Outputs the bit pattern corresponding to 10.0
    
        // Convert real to integer
        real_value = 7.5;
        int_value = $rtoi(real_value);
        $display("Real to Integer: %d", int_value); // Outputs: Real to Integer: 7
    end
endmodule