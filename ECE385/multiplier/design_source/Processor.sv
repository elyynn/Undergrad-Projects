//4-bit logic processor top level module
//for use with ECE 385 Fall 2023
//last modified by Satvik Yellanki


//Always use input/output logic types when possible, prevents issues with tools that have strict type enforcement

module Processor (
	input  logic        Clk,     // Internal
	input  logic        Reset,   // Push button 0
	input  logic        Execute, // Push button 3
	input  logic [7:0]  Din,

//    output logic Execute_SH,
	output logic [7:0]  Aval,    // DEBUG
	output logic [7:0]  Bval,    // DEBUG
	output logic x_val,
	output logic [7:0]  hex_seg, // Hex display control
	output logic [3:0]  hex_grid // Hex display control
); 

    //local logic variables go here
	logic Reset_SH;
//	logic Execute_SH;
    logic clr,clr_ld,shift_en,add_en,sub_en;

//	logic       M;
	logic [7:0] A; 
	logic [7:0] B; 
	logic [7:0] Din_S;
	logic x_out;
    assign x_val = x_out;
	 
	 
//We can use the "assign" statement to do simple combinational logic
	assign Aval = A;
	assign Bval = B;
//Instantiation of modules here
register_unit reg_unit(
	.clk(Clk), 
	.clr_ld(clr_ld),
	.clr(clr), 
	.shift_en(shift_en),
	.add_en(add_en),
	.sub_en(sub_en),
	.s(Din_S), 
	.mid_shift(A[0]), 
	.A_out(A), 
	.B_out(B),
	.x(x_out)
	); // set input/output size based on parameters data_q)

	control control_unit (
		.Clk        (Clk),
		.Reset      (Reset_SH),
		.Execute    (Execute_SH),

		.shift_en   (shift_en),
		.clr(clr), 
		.clr_ld(clr_ld),
		.add_en(add_en),
		.sub_en(sub_en)
//		.state(state)
	);
                    
//When you extend to 8-bits, you will need more HEX drivers to view upper nibble of registers, for now set to 0
	HexDriver HexA (
		.clk        (Clk),
		.reset(Reset),

		.in         ({A[7:4],A[3:0],B[7:4],B[3:0]}),
		.hex_seg    (hex_seg),
		.hex_grid   (hex_grid)
	);
                            
//Input synchronizers required for asynchronous inputs (in this case, from the switches)
//These are array module instantiations
//Note: S stands for SYNCHRONIZED, H stands for active HIGH, in addition in synthesis they are also debounced

	sync_debounce button_sync [1:0] (
		.Clk  (Clk),

		.d    ({Reset, Execute}),
		.q    ({Reset_SH, Execute_SH})
	);

	sync_debounce Din_sync [7:0] (
		.Clk  (Clk), 

		.d    (Din), 
		.q    (Din_S)
	);
	
	  
endmodule
