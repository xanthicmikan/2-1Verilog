1.
```bash
------------------------------------------------------------------------
|Delays	        |Description                                            |
------------------------------------------------------------------------
|Rise delay (Tr)|The time taken for the output of a gate to change      |
|               |from some value to 1 from either 0, X or Z             | 
------------------------------------------------------------------------
|Fall delay (Tf)|The time taken for the output of a gate to change      |
|               |from some value to 0 from either 1, X or Z             |
------------------------------------------------------------------------
|Turn-off delay	|The time taken for the output of a gate to change      |
|     (To)      | to Z, high impedance from either 0, 1, or X           |
------------------------------------------------------------------------

                                     Turn-off delay	
Rise delay          Fall delay         |To| 
   |Tr|               |Tf|           ￣|↘|__ 
 __|↗|￣            ￣|↘|__         __|↗|
```

2.
```verilog
 // Single delay specified - used for all three types of transition delays
or #(<delay>) o1 (out, a, b);

// Two delays specified - used for Rise and Fall transitions
or #(<rise>, <fall>) o1 (out, a, b);

// Three delays specified - used for Rise, Fall and Turn-off transitions
or #(<rise>, <fall>, <turn_off>) o1 (out, a, b);
```
```bash
---------------------------------------------------------------------------------------------
|Specification  |                 Usage                             | Format                 |
---------------------------------------------------------------------------------------------
|One delay      |Same value for Rise, Fall and Turn-off transitions |#(delay)                |
--------------------------------------------------------------------------------------------- 
|Two delay      |Rise, Fall transitions	                            |#(rise, fall)           |
---------------------------------------------------------------------------------------------
|Three delay    |Rise, Fall and Turn-off transitions                |#(rise, fall, turn-off) |
---------------------------------------------------------------------------------------------
```
