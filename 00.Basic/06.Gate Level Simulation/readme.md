### ◆ Gate Level Simulations
#### 1. GLS simulations 
* Zero Delay Simulation
* Unit Delay Simulation
* SDF Simulation

#### 2.Why is GLS run?
* Verify ECOs
* CDC Paths
* Reset/Initialization Verification
* X Optimization in RTL
* Asynchronous path timing Verification
* Low Power and DFT Scan chain structure
* Verify Glitches on Edge Sensitive Signals
	
### ◆ Verilog Timing Checks
#### 1.Timing checks must be placed inside a specify block in a Verilog module.
```verilog
specify
  // Timing check statements
endspecify
	
specify
    $setup(data_signal, posedge clk, setup_time_limit);     // posedge clk is reference event
    $hold(posedge clk, data_signal, hold_time_limit);       // data_signal is the data event
endspecify
```
#### 2.
```verilog
$setup
    $setup(data_event, reference_event, limit[, notifier]);
    For example : $setup(data, posedge clk, 3);
$hold
    $hold(reference_event, data_event, limit[, notifier]);
    For example : $hold(posedge clk, data, 5);
$setuphold	
    $setuphold(reference_event, data_event, setup_limit, hold_limit[, notifier]);
    For example : $setuphold(posedge clk, data, 5, 10);
$recovery
    $recovery(reference_event, data_event, limit[, notifier]);
    For example : $recovery(posedge clk, reset, 4);
$removal
    $removal(reference_event, data_event, limit[, notifier]);
    For example : $removal(posedge clk, data_signal, 5);
$recrem
    $recrem(reference_event, data_event, rec_limit, rem_limit[, notifier]);
    For example : $recrem(posedge clk, data_signal, 5);
```	

### ◆ Standard Delay Format(SDF) 
#### 1.What is it used For
* Timing Representation
* Interoperability
* Back-Annotation
* Forward Annotation
#### 2.An SDF file consists of several key sections:
* Header Section
* Cell and Instance Definitions
* Path Delays
* Timing Checks
#### 3.Application of SDF
* Static Timing Analysis
* Post-Layout Verification
* Simulation
* Design Optimization

### ◆ SDF annotate
#### 1.To read the specified SDF file and apply its timing information to the design
```verilog
$sdf_annotate("/path/to/timing_data.sdf", top_level_instance); 
```
#### 2.SDF contents
SDF timing values are specified within a CELL declaration.  
sections : DELAY, TIMINGCHECK, and LABEL.
#### 3.Mappinf of SDF Paths
```Verilog
For example:
The rise/fall times of 0.0151 and 0.0168 are annotated to the specify path.

// SDF file:
IOPATH clk_i clk (0.0151::0.0168) (0.0221::0.235)

// Verilog specify path:
(clk_i => clk) = 0;
```