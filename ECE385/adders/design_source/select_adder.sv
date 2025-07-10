module small_ripple_adder (
	input  logic  [3:0] a, 
    input  logic  [3:0] b,
	input  logic         cin,
	
	output logic  [3:0] s,
	output logic         cout
);

	/* TODO
		*
		* Insert code here to implement a ripple adder.
		* Your code should be completly combinational (don't use always_ff or always_latch).
		* Feel free to create sub-modules or other files. */
logic       c1, c2, c3;
 
full_adder  FA0(.x(a[0]), .y(b[0]), .z(cin), .s(s[0]), .c(c1));
full_adder  FA1(.x(a[1]), .y(b[1]), .z(c1), .s(s[1]), .c(c2));
full_adder  FA2(.x(a[2]), .y(b[2]), .z(c2), .s(s[2]), .c(c3));
full_adder  FA3(.x(a[3]), .y(b[3]), .z(c3), .s(s[3]), .c(cout));
endmodule


module MUX(
    input logic x, 
    input logic [3:0] in0,in1,
  
    output logic [3:0] out);
    
    always_comb begin
    if (!x) 
    out = in0;
    else 
    out = in1;
    end
    
    endmodule



module select_adder (
	input  logic  [15:0] a, 
    input  logic  [15:0] b,
	input  logic         cin,
	
	output logic  [15:0] s,
	output logic         cout
);
    logic c4, c8, c12;
    logic c8_0, c8_1, c12_0, c12_1, c16_0, c16_1;
    logic [15:0]s0, s1;
    small_ripple_adder small_ripple_adder0(.a(a[3:0]), .b(b[3:0]), .cin(cin), .s(s[3:0]), .cout(c4));
    small_ripple_adder small_ripple_adder1_0(.a(a[7:4]), .b(b[7:4]), .cin(0), .s(s0[7:4]), .cout(c8_0));
    small_ripple_adder small_ripple_adder1_1(.a(a[7:4]), .b(b[7:4]), .cin(1), .s(s1[7:4]), .cout(c8_1));
    small_ripple_adder small_ripple_adder2_0(.a(a[11:8]), .b(b[11:8]), .cin(0), .s(s0[11:8]), .cout(c12_0));
    small_ripple_adder small_ripple_adder2_1(.a(a[11:8]), .b(b[11:8]), .cin(1), .s(s1[11:8]), .cout(c12_1));
    small_ripple_adder small_ripple_adder3_0(.a(a[15:12]), .b(b[15:12]), .cin(0), .s(s0[15:12]), .cout(c16_0));
    small_ripple_adder small_ripple_adder3_1(.a(a[15:12]), .b(b[15:12]), .cin(1), .s(s1[15:12]), .cout(c16_1));
    assign c8 = c4&c8_1|c8_0;
    assign c12 = c8&c12_1|c12_0;
    assign cout = c12&c16_1|c16_0;
    MUX MUX4(.x(c4), .in0(s0[7:4]), .in1(s1[7:4]), .out(s[7:4]));
    MUX MUX8(.x(c8), .in0(s0[11:8]), .in1(s1[11:8]), .out(s[11:8]));
    MUX MUX12(.x(c12), .in0(s0[15:12]), .in1(s1[15:12]), .out(s[15:12]));

	/* TODO
		*
		* Insert code here to implement a CSA adder.
		* Your code should be completly combinational (don't use always_ff or always_latch).
		* Feel free to create sub-modules or other files. */
	

endmodule
