module testbench8(); //even though the testbench doesn't create any hardware, it still needs to be a module

	timeunit 10ns;	// This is the amount of time represented by #1 
	timeprecision 1ns;

	// These signals are internal because the processor will be 
	// instantiated as a submodule in testbench.
	logic       Clk;
	logic       Reset;
	logic       Execute;
	logic [7:0] Din;
	logic [7:0] Aval;
	logic [7:0] Bval;
	logic x_val;
	logic [7:0] hex_seg;
	logic [3:0] hex_grid;
//	logic [3:0] state;
	logic Execute_SH;
			

	// To store expected results
//	logic [15:0] ans_17;
	
	// Instantiating the DUT (Device Under Test)
	// Make sure the module and signal names match with those in your design
	// Note that if you called the 8-bit version something besides 'Processor'
	// You will need to change the module name
	Processor processor0(.*);	


	initial begin: CLOCK_INITIALIZATION
		Clk = 1'b1;
	end 

	// Toggle the clock
	// #1 means wait for a delay of 1 timeunit, so simulation clock is 50 MHz technically 
	// half of what it is on the FPGA board 

	// Note: Since we do mostly behavioral simulations, timing is not accounted for in simulation, however
	// this is important because we need to know what the time scale is for how long to run
	// the simulation
	always begin : CLOCK_GENERATION
		#1 Clk = ~Clk;
	end

	// Testing begins here
	// The initial block is not synthesizable on an FPGA
	// Everything happens sequentially inside an initial block
	// as in a software program

	// Note: Even though the testbench happens sequentially,
	// it is recommended to use non-blocking assignments for most assignments because
	// we do not want any dependencies to arise between different assignments in the 
	// same simulation timestep. The exception is for reset, which we want to make sure
	// happens first. 
	initial begin: TEST_VECTORS
		Reset = 1;		// Toggle Reset (use blocking operator), because we want to have this happen 'first'
		Execute <= 0;
		Din <= 8'b10111111;	// Specify Din, F, and R

		repeat (3) @(posedge Clk); //each @(posedge Clk) here means to wait for 1 clock edge, so this waits for 3 clock edges
	
		Reset <= 0;

        repeat (5) @(posedge Clk);
		@(posedge Clk);
		Din <= 8'b11101101;	// Change Din

		repeat (10) @(posedge Clk);

		@(posedge Clk);
		Execute <= 1;	// Toggle Execute

		repeat (30) @(posedge Clk);
		Execute <= 0;
		repeat (20) @(posedge Clk);

//		ans_17 = (8'h33 * 8'h55); // Expected result of 1st cycle
		// Aval is expected to be 8'h33 XOR 8'h55
		// Bval is expected to be the original 8'h55
		
		//These are called 'immediate' assertions, because they assert if a condition is true
		//at the time of execution.
//		assert ({Aval,Bval} == ans_17) else $display("1st cycle A ERROR: ans is %h", {Aval,Bval});

		$finish(); //this task will end the simulation if the Vivado settings are properly configured


	end

endmodule
