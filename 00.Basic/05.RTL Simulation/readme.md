#### 1. Simulation is a technique of applying different input stimulus to the design at different times to check if the RTL code behaves the intended way.

#### 2. DUT or Design Under Test is the Verilog module or design that you want to test. It could be a simple component like an adder or a more complex design like a microprocessor. The testbench itself is implemented as a separate top-level Verilog module. 

#### 3. The testbench called tb is a container to hold a design module. 

#### 4. Timescale
```verilog
`timescale <time_unit>/<time_precision>

  For example :
    `timescale 1ns/1ps
    `timescale 10us/100ns
    `timescale 10ns/1ns
```
#### 5. Event Queue
* active region
* inactive region
* Nonblocing assignment region
* monitor region

#### 6. Simulations are required to operate on a given timescale that has a limited precision as specified by the timescale directive.