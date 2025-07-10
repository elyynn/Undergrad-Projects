module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.


logic [15:0] sw_i;
logic clk, reset, run_i, continue_i;
logic [15:0] led_o;
logic [7:0]  hex_seg_left, hex_seg_right;
logic [3:0]  hex_grid_left, hex_grid_right;
logic [15:0] ir;
logic [15:0] mar;
logic [15:0] mdr;
logic [15:0] pc;
logic [15:0] bus;
logic [1:0] ALUK;
logic [15:0] cpu_wdata;
logic [15:0] hex_display;
logic [15:0] ALU_OUT;
logic [3:0] opcode;
//logic [15:0] SR1_OUT;
//logic [15:0] SR2MUX_OUT;
//logic [15:0] sr2out;

//logic [15:0] r1;
logic [4:0] state;

processor_top processor_top0(.*);
assign ir = processor_top0.slc3.cpu.ir;
assign pc = processor_top0.slc3.cpu.pc;
assign mar = processor_top0.slc3.cpu.mar;
assign mdr = processor_top0.slc3.cpu.mdr;
assign bus = processor_top0.slc3.cpu.bus;
assign ALUK = processor_top0.slc3.cpu.aluk;
assign cpu_wdata = processor_top0.slc3.io_bridge.cpu_wdata;
assign hex_display = processor_top0.slc3.io_bridge.hex_display;
assign ALU_OUT = processor_top0.slc3.cpu.aluk_out;
assign opcode = processor_top0.slc3.cpu.cpu_control.opcode;
//assign SR1_OUT = processor_top0.slc3.cpu.ALU0.SR1_OUT;
//assign SR2MUX_OUT = processor_top0.slc3.cpu.ALU0.SR2MUX_OUT;
//assign sr2mux = processor_top0.slc3.cpu.sr2mux;
//assign sr2out = processor_top0.slc3.cpu.SR2_value;
//assign r1 = processor_top0.slc3.cpu.reg_file0.R1;
assign state = processor_top0.slc3.cpu.cpu_control.state;
initial begin: CLOCK_INITIALIZATION
	clk = 1'b1;
end 

// Toggle the clock
// #1 means wait for a delay of 1 timeunit, so simulation clock is 50 MHz technically 
// half of what it is on the FPGA board 

// Note: Since we do mostly behavioral simulations, timing is not accounted for in simulation, however
// this is important because we need to know what the time scale is for how long to run
// the simulation
always begin : CLOCK_GENERATION
	#1 clk = ~clk;
end

// Basic I/O test2
initial begin: TEST_VECTORS
reset = 1;
sw_i = 16'h0006;

#10 reset = 0;
#10 run_i = 1;

#15 run_i = 0;
#40;
sw_i = 16'h1234;
#17 continue_i = 1;
#40;
sw_i = 16'h5678;
#15 continue_i = 0;

//test xor
//initial begin: TEST_VECTORS
//reset = 1;
////sw_i = 16'h0014;
//#10 reset = 0;
//sw_i = 16'h0015;
//#10 run_i = 1;

//#15 run_i = 0;

////#10 run_i = 1;

//#40;
//sw_i = 16'h000f;
//#17 continue_i = 1;
//#15 continue_i = 0;

// #20;
//sw_i = 16'h00f0;
//#17 continue_i = 1; 
//#20 continue_i = 0;
//#80;
$finish;	
end
endmodule

