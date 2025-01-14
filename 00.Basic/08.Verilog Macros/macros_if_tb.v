//`define MACRO1
module tb;
    initial begin

`ifdef MACRO1
    $display ("This is MACRO1");
`elsif MACRO2
    $display ("This is MACRO2");
`endif

    end
endmodule