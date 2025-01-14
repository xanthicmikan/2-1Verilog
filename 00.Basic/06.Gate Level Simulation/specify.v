module uut (
    input a,
    input b,
    output wire out
);

    specify
      
        specparam TRise = 5; 
        specparam TFall = 3; 
    
        (a => out) = TRise;   // Delay from input 'a' to output 'out'
        (b => out) = TFall;   // Delay from input 'b' to output 'out'
    
        // System timing check for setup time
        $setup(a, out, 10);   // Check setup time for signal 'a' relative to 'out'
    endspecify
    
    assign out = a & b; 

endmodule