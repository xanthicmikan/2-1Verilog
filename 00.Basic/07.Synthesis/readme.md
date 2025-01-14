### 1. Synthesis is the process of transforming high-level Verilog code, which describes digital circuits, into a lower-level representation 

### 2. Synthesis = translation + optimization + mapping  
translation is that using RTL code to netlist  
optimization is that optimize clk period、area、power consumption  
mapping is that mapping netlist and technology library  

### 3. What is a synthesis constraint file ?
 A Synthesis Constraint File is typically written in the Synopsys Design Constraints (SDC) format.
 ```verilog
for example :

# Set the version of the SDC file
set_version 2.1

# Define the clock
create_clock -period 10 [get_ports clk]  ; # 100 MHz clock

# Set input delay constraints
set_input_delay -max 2 [get_ports data_in[*]] -clock [get_clocks clk]
set_input_delay -min 1 [get_ports data_in[*]] -clock [get_clocks clk]

# Set output delay constraints
set_output_delay -max 3 [get_ports data_out[*]] -clock [get_clocks clk]
set_output_delay -min 1 [get_ports data_out[*]] -clock [get_clocks clk]

# Set load capacitance on output ports
set_load 0.01 [get_ports data_out[*]]

# Define false paths (if any)
set_false_path -from [get_ports reset] -to [get_ports data_out[*]]

# Set maximum fanout for specific ports
set_max_fanout 10 [get_ports data_in[*]]
```
	
### 4. Verilog constructs to avoid: not all Verilog features are suitable for synthesis
```bash   
----------------------------------------------------------------------------------------------	
|Initial Blocks	        |The initial block is used for testbenches but is not synthesizable. |
|                       |It is ignored during synthesis.                                     |
----------------------------------------------------------------------------------------------		
|Delay Constructs       |Any use of delays (e.g., #10) is not supported in synthesis.        |
|                       |Such constructs are only relevant for simulation.                   |
----------------------------------------------------------------------------------------------		
|Real Data Types        |The real and time data types are not synthesizable.                 |
----------------------------------------------------------------------------------------------		
|Fork/Join Constructs	|Keywords like fork, join, join_any and join_none are                |
|                       |not supported in synthesis.                                         |
----------------------------------------------------------------------------------------------		
|Random Functions       |Keywords such as $random are used for random number                 |
|                       |generation but are not synthesizable.                               |
----------------------------------------------------------------------------------------------	
|X and Z States	        |The use of unknown (x) and high impedance (z) states is             |
|                       |typically not allowed in synthesizable designs.                     |
----------------------------------------------------------------------------------------------	
|Primitives             |Only gate level primitives are supported.                           |
----------------------------------------------------------------------------------------------	
|Force and Release      |Force and release of data types not supported.                      |
----------------------------------------------------------------------------------------------
```

### 5. In synthesis, comparisons to x (unknown) and z (high impedance) states are generally ignored.

### 6. Avoid "Multiple Drive"

### 7. Coding Style Effect : area, power and reusability
