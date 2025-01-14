module halfadder(   input a,
                    input b,
                    output carry,
                    output sum);

   assign {carry, sum} = a + b;

endmodule