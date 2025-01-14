### 1. Block Namespace
```verilog
For example :
  module uut;
      reg signal;
  
      task myTask;
          reg signal;    // This 'signal' is local to myTask
          
        begin
          reg signal;    // This 'signal' is local to this begin-end block
        end
      endtask
  endmodule
```
### 2. Module Namespace
```verilog
For example :
  module A;
    reg signal;    // 'signal' is local to module A
  endmodule
  
  module B;
    reg signal;    // 'signal' is local to module B
  endmodule
```
### 3. Generate Namespace
```verilog
For example :	
  genvar i;// 'i' genvar variable is visible only inside this
  generate
      for (i = 0; i < N; i = i + 1) begin : adder_instance
          half_adder HA (
              .a(A[i]),
              .b(B[i]),
              .sum(SUM[i]),
              .carry(CARRY[i])
          );
      end
  endgenerate
```
### 4. Specify Namespace
```verilog
For example :
  specify
    specparam  Thold = 5;     // Tdelay is visible only inside this specify block
  
    $hold(clk, d, Thold);
  endspecify  
```
### 5. VCD file, Value Change Dump files, are a standardized ASCII format used to store simulation data from Verilog and other hardware description languages.

* A VCD file consists of several key sections :  
Header Section  
Variable Definitions  
Value Change Section  
 
* $dumpfile
```verilog
$dumpfile(<filename>);
  For example : $dumpfile("wave1.vcd"); 
```
* $dumpvars
```verilog
$dumpvars(levels, [list_of_modules_or_variables]);
  For example : 
      $dumpvars (0);        
      $dumpvars (0, tb);    
      $dumpvars (1, tb);    
      $dumpvars (0, tb.uut, tb.alu.a);
```
* $dumpon & $dumpoff
* $dumpall : creates a checkpoint in the VCD file
* $dumplimit : used to control the size of the VCD file
```verilog
$dumplimit;
  For example : $dumplimit(1048576);
```