### 1. Verilog section template
```verilog
	module [design_name] ( [port_list] );

		[list_of_input_ports]
		[list_of_output_ports]

		[declaration_of_other_signals]

		[other_module_instantiations_if_required]

		[behavioral_code_for_this_module]
	endmodule
```
### 2. ASIC Flow

* stage 1  
Collect requirements -> Product specification -> Architecture specification
* stage 2  
Desige RTL & Pre-silicon verification -> Logic Synthesis/Netlist -> Equivalence Check -> P&R
* stage 3  
Post-silicon verification

### 3. Design Abstraction Layers
* Design Abstraction  
Architecture level & RTL level & Schematic level & Transistor level & Physical level
* Desige styles  
Top-Down & Bottom-up