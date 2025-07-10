module smallCLA(input logic [3:0] a,
    input  logic  [3:0] b,
	input  logic  cin,
	
	output logic  [3:0] s,
	output logic  gg,
	output logic pg);
	
	logic c1,c2,c3,g0,g1,g2,g3,p0,p1,p2,p3;
	always_comb
    begin
    g0 = a[0]&b[0];
    g1 = a[1]&b[1];
    g2 = a[2]&b[2];
    g3 = a[3]&b[3];
    p0 = a[0]^b[0];
    p1 = a[1]^b[1];
    p2 = a[2]^b[2];
    p3 = a[3]^b[3];
    c1 = (cin&p0)|g0;
    c2 = (cin&p0&p1)|(g0&p1)|g1;
    c3 = (cin&p0&p1&p2)|(g0&p1&p2)|(g1&p2)|g2;
    s[0] = a[0]^b[0]^cin;
    s[1] = a[1]^b[1]^c1;
    s[2] = a[2]^b[2]^c2;
    s[3] = a[3]^b[3]^c3;
    gg = g3|(g2&p3)|(g1&p3&p2)|(g0&p3&p2&p1);
    pg = p0&p1&p2&p3;
    end
endmodule

module lookahead_adder (
	input  logic  [15:0] a, 
    input  logic  [15:0] b,
	input  logic         cin,
	
	output logic  [15:0] s,
	output logic         cout
);

	/* TODO
		*
		* Insert code here to implement a CLA adder.
		* Your code should be completly combinational (don't use always_ff or always_latch).
		* Feel free to create sub-modules or other files. */
		logic gg0, gg4, gg8, gg12, pg0, pg4, pg8, pg12, c4, c8, c12;
		always_comb
        begin
        c4 = (cin & pg0) | gg0;
        c8 = (gg4) | (gg0&pg4) | (cin&pg0&pg4);
        c12 = (gg8) | (gg4&pg8) | (gg0 & pg8 & pg4) | (cin & pg8 & pg4 & pg0);
        cout = (gg12) | (gg8&pg12) | (gg4&pg8&pg12) | (gg0 & pg8 & pg4 & pg12) | (cin & pg8 & pg4 & pg0 & pg12);
		end
        
		smallCLA smallCLA0(.a(a[3:0]), .b(b[3:0]), .cin(cin), .s(s[3:0]), .gg(gg0), .pg(pg0));		
		smallCLA smallCLA1(.a(a[7:4]), .b(b[7:4]), .cin(c4), .s(s[7:4]), .gg(gg4), .pg(pg4));
		smallCLA smallCLA2(.a(a[11:8]), .b(b[11:8]), .cin(c8), .s(s[11:8]), .gg(gg8), .pg(pg8));
		smallCLA smallCLA3(.a(a[15:12]), .b(b[15:12]), .cin(c12), .s(s[15:12]), .gg(gg12), .pg(pg12));

endmodule
