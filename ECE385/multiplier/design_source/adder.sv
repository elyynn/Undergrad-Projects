module full_adder  (input logic x, y, z,
 				 output logic s, c );
	assign s = x^y^z;
	assign c = (x&y)|(y&z)|(x&z);
endmodule


module adder (
	input  logic  [8:0] a, 
    input  logic  [8:0] b,
	input  logic         cin,
	
	output logic  [8:0] s,
	output logic         cout
);

	/* TODO
		*
		* Insert code here to implement a ripple adder.
		* Your code should be completly combinational (don't use always_ff or always_latch).
		* Feel free to create sub-modules or other files. */
logic       c1, c2, c3, c4, c5, c6, c7, c8;
 
full_adder  FA0(.x(a[0]), .y(b[0]), .z(cin), .s(s[0]), .c(c1));
full_adder  FA1(.x(a[1]), .y(b[1]), .z(c1), .s(s[1]), .c(c2));
full_adder  FA2(.x(a[2]), .y(b[2]), .z(c2), .s(s[2]), .c(c3));
full_adder  FA3(.x(a[3]), .y(b[3]), .z(c3), .s(s[3]), .c(c4));
full_adder  FA4(.x(a[4]), .y(b[4]), .z(c4), .s(s[4]), .c(c5));
full_adder  FA5(.x(a[5]), .y(b[5]), .z(c5), .s(s[5]), .c(c6));
full_adder  FA6(.x(a[6]), .y(b[6]), .z(c6), .s(s[6]), .c(c7));
full_adder  FA7(.x(a[7]), .y(b[7]), .z(c7), .s(s[7]), .c(c8));
full_adder  FA8(.x(a[8]), .y(b[8]), .z(c8), .s(s[8]), .c(cout));
endmodule

module subtractor (
	input  logic  [8:0] a, 
    input  logic  [8:0] b,	
	output logic  [8:0] s,
	output logic   cout
);
logic [8:0] b_not;
assign b_not = ~b;
adder subadder(.a(a), .b(b_not), .cin(1), .s(s), .cout(cout));
endmodule