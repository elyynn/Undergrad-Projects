module register_unit (
	input  logic        clk, 
	input  logic        clr_ld,
	input  logic        add_en,
	input  logic        sub_en,
	input  logic        shift_en,
	input  logic        clr, 
	input  logic 		mid_shift,
	input  logic [7:0]  s,

	output logic [7:0]  A_out,
	output logic [7:0]  B_out,
	output logic x
);
 logic M_val,M ;
 assign M_val = M;
reg_A Reg_A(
	.clk(clk), 
	.clr_ld(clr_ld), 
	.shift_en(shift_en), 
	.add_en(add_en), 
	.sub_en(sub_en), 
	.clr(clr),
	.M(M_val), 
	.s(s),

	.x(x),
	.data_q(A_out)
	);

reg_B Reg_B(
	.clk(clk), 
	.clr_ld(clr_ld), 
	.shift_en(shift_en), 
	.s(s), 
	.shift_input(mid_shift),


	.data_q(B_out),
	.M(M)
	);

endmodule
