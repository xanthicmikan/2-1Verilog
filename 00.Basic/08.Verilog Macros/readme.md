### 1. Compiler directives in Verilog
```verilog
`define
    for example : `define CLK_PERIOD 20
`include
    for example : `include "definitions.v"
`ifdef & `ifndef
    for example : 
        `ifdef DEBUG
        $display("Debug mode is on");
        `endif
`undef
    for example : `undef CLK_PERIOD
`timescale 
    for example : `timescale 1ns / 10ps
`default_nettype 
    for example : `default_nettype wire
`resetall 
    for example : `resetall	
```
### 2. Verilog macros
```verilog
Macros :  
`define MACRO_NAME [ (arguments) ] macro_body
    for example :
        `define ADD(a, b) ((a) + (b))
        module example;
            initial begin
                $display("Sum: %d", `ADD(5, 3));
            end
        endmodule
Multiline Macros :  
    for example :
        `define MULTI_LINE_MACRO \
            begin \
                $display("This is a multi-line macro."); \
            end
```
### 3. Avoid Overuse of macros

### 4. Utilize include files for macro libraries

### 5. \`ifdef \&  \`ifndef
```verilog
for example : 
    // Style #1: Only single `ifdef
    `ifdef <FLAG>
    	// Statements
    `endif
    
    // Style #2: `ifdef with `else part
    `ifdef <FLAG>
    	// Statements
    `else
    	// Statements
    `endif
    
    // Style #3: `ifdef with additional ifdefs
    `ifdef <FLAG1>
    	// Statements
    `elsif <FLAG2>
    	// Statements
    `elsif <FLAG3>
    	// Statements
    `else
    	// Statements
    `endif
```