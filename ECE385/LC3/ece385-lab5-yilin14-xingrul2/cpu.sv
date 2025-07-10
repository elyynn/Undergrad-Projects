//------------------------------------------------------------------------------
// Company: 		 UIUC ECE Dept.
// Engineer:		 Stephen Kempf
//
// Create Date:    
// Design Name:    ECE 385 Given Code - SLC-3 core
// Module Name:    SLC3
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 09-22-2015 
//    Revised 06-09-2020
//	  Revised 03-02-2021
//    Xilinx vivado
//    Revised 07-25-2023 
//    Revised 12-29-2023
//------------------------------------------------------------------------------

module cpu (
    input   logic        clk,
    input   logic        reset,

    input   logic        run_i,
    input   logic        continue_i,
    output  logic [15:0] hex_display_debug,
    output  logic [15:0] led_o,
   
    input   logic [15:0] mem_rdata,
    output  logic [15:0] mem_wdata,
    output  logic [15:0] mem_addr,
    output  logic        mem_mem_ena,
    output  logic        mem_wr_ena

);

// Internal connections
logic ld_mar; //
logic ld_mdr; //
logic ld_ir; //
logic ld_ben; 
logic ld_cc; 
logic ld_reg; 
logic ld_pc; //
logic ld_led;

logic gate_pc;
logic gate_mdr;
logic gate_alu; 
logic gate_marmux;

logic [1:0] pcmux;
logic       drmux;
logic       sr1mux;
logic       sr2mux;
logic       addr1mux;
logic [1:0] addr2mux;
logic [1:0] aluk;
logic       mio_en;

logic [15:0] mdr_in;
logic [15:0] pc_in;
logic [15:0] mar; 
logic [15:0] mdr;
logic [15:0] ir;
logic [15:0] pc;
logic ben;

logic [15:0] bus;

logic [15:0] SR1_value;
logic [15:0] SR2_value;

logic [2:0] dr_index;
logic [2:0] sr1_index;
logic [15:0] sr2_mux_o;
logic [15:0] addr1_mux_o;
logic [15:0] addr2_mux_o;
logic [15:0] aluk_out;
logic [15:0] adder_o;
assign adder_o = addr1_mux_o + addr2_mux_o;

assign mem_addr = mar;
assign mem_wdata = mdr;
//assign mdr_in = mem_rdata;
// State machine, you need to fill in the code here as well
// .* auto-infers module input/output connections which have the same name
// This can help visually condense modules with large instantiations, 
// but can also lead to confusing code if used too commonly

control cpu_control (
    .clk(clk), 
	.reset(reset),
	.ir(ir),
	.ben(ben),
	.mem_rdata(mem_rdata),
	.continue_i(continue_i),
	.run_i(run_i),
	.ld_mar(ld_mar),
	.ld_mdr(ld_mdr),
	.ld_ir(ld_ir),
	.ld_ben(ld_ben),
	.ld_cc(ld_cc),
	.ld_reg(ld_reg),
	.ld_pc(ld_pc),
	.ld_led(ld_led),
	.gate_pc(gate_pc),
	.gate_mdr(gate_mdr),
	.gate_alu(gate_alu),
	.gate_marmux(gate_marmux),
	.pcmux(pcmux),
	.drmux(drmux),
	.sr1mux(sr1mux),
	.sr2mux(sr2mux),
	.addr1mux(addr1mux),
	.addr2mux(addr2mux),
	.aluk(aluk),
	.mio_en(mio_en),
	.mem_mem_ena(mem_mem_ena), // Mem Operation Enable
	.mem_wr_ena(mem_wr_ena)  // Mem Write Enable
);


assign led_o = ir;
assign hex_display_debug = ir;

load_reg #(.DATA_WIDTH(16)) ir_reg (
    .clk    (clk),
    .reset  (reset),

    .load   (ld_ir),
    .data_i (bus),

    .data_h (ir)
);

load_reg #(.DATA_WIDTH(16)) pc_reg (
    .clk(clk),
    .reset(reset),

    .load(ld_pc),
    .data_i(pc_in),

    .data_h(pc)
);

load_reg #(.DATA_WIDTH(16)) mar_reg (
    .clk(clk),
    .reset(reset),

    .load(ld_mar),
    .data_i(bus),

    .data_h(mar)
);

load_reg #(.DATA_WIDTH(16)) mdr_reg (
    .clk(clk),
    .reset(reset),

    .load(ld_mdr),
    .data_i(mdr_in),

    .data_h(mdr)
);

bus bus0(
    .gate_pc(gate_pc),
    .gate_alu(gate_alu),
    .gate_mdr(gate_mdr),// all four control signal for bus
    .gate_marmux(gate_marmux),

    .mdr(mdr),
    .pc(pc),
    .aluk_out(aluk_out),
    .marmux_out(adder_o),

    .bus(bus)
    );

MUX MUX0(.pcmux(pcmux),
    .bus(bus),
    .pc(pc),
    .ir(ir),

    .pc_mux_o(pc_in),
    
    .mio_en(mio_en),
//     .mio_en(1),   //this is for 5.1, need change
    .rdata(mem_rdata),

    .mio_mux_o(mdr_in),

    .sr2_sel(sr2mux),
    .sr2_out(SR2_value),
    .sr2_mux_o(sr2_mux_o), //sr2_mux

    .addr1_sel(addr1mux),
    // input logic [15:0] pc,
    .sr1_out(SR1_value),
    .addr1_mux_o(addr1_mux_o),  //addr1_mux  

    .dr_sel(drmux),
    // input logic [2:0] ir9to11,
    // input 3b'111
    .dr_mux_o(dr_index),  //dr_mux  

    .sr1_sel(sr1mux),
    // input logic [2:0] ir9to11,
    // input logic [2:0] ir6to8,
    .sr1_mux_o(sr1_index),  //sr1_mux  

    .addr2_sel(addr2mux),
    .addr2_mux_o(addr2_mux_o), //addr2_mux
    .adder_o(adder_o)
    );


reg_file reg_file0(
    .clk(clk), 
	.reset(reset), 
	.load(ld_reg),
    .DR_index(dr_index),
    .SR1_index(sr1_index),
    .SR2_index(ir[2:0]),
	.bus_in(bus),

	.SR1_O(SR1_value),
	.SR2_O(SR2_value));

ALU ALU0(.SR2MUX_OUT(sr2_mux_o), 
         .SR1_OUT(SR1_value),
		.ALUK(aluk),
		.ALU_OUT(aluk_out)
			);

nzp nzp0(
    .clk(clk),
    .reset(reset),
    .bus(bus),
    .ld_cc(ld_cc),
    .ld_ben(ld_ben),
    .ir9to11(ir[11:9]),
    .BEN(ben)
);

endmodule