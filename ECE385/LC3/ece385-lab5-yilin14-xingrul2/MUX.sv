module MUX(    input logic [1:0] pcmux,
    input logic [15:0] bus,
    input logic [15:0] pc,
    input logic [15:0] ir,

    output logic [15:0] pc_mux_o, //pc_mux
    
    input logic mio_en,
    input logic [15:0] rdata,

    output logic [15:0] mio_mux_o, //mio_mux

    input logic sr2_sel,
    input logic [15:0] sr2_out,
    // input logic [15:0] ir_sext,
    output logic [15:0] sr2_mux_o, //sr2_mux

    input logic addr1_sel,
    // input logic [15:0] pc,
    input logic [15:0] sr1_out,
    output logic [15:0] addr1_mux_o,  //addr1_mux  

    input logic dr_sel,
    // input logic [2:0] ir9to11,
    // input 3b'111
    output logic [2:0] dr_mux_o,  //dr_mux  

    input logic sr1_sel,
    // input logic [2:0] ir9to11,
    // input logic [2:0] ir6to8,
    output logic [2:0] sr1_mux_o,  //sr1_mux  

    input logic [1:0] addr2_sel,
    output logic [15:0] addr2_mux_o, //addr2_mux
    input logic [15:0] adder_o
    );

    //instantiation of muxes
    pc_mux pc_mux0(.*);
    mio_mux mio_mux0(.*);

    Mux2to1 #(
    .WIDTH(16)
    ) sr2_mux(
    .data0(sr2_out),
    .data1({{11{ir[4]}},ir[4:0]}),
    .sel(sr2_sel), 
    .out(sr2_mux_o)
    );

    Mux2to1 #(
    .WIDTH(16)
    ) addr1_mux(
    .data0(pc),
    .data1(sr1_out),
    .sel(addr1_sel), 
    .out(addr1_mux_o)
    );

    Mux2to1 #(
    .WIDTH(3)
    ) sr1_mux(
    .data0(ir[11:9]),
    .data1(ir[8:6]),
    .sel(sr1_sel), 
    .out(sr1_mux_o)
    );

    Mux2to1 #(
    .WIDTH(3)
    ) dr_mux(
    .data0(ir[11:9]),
    .data1(3'b111),
    .sel(dr_sel), 
    .out(dr_mux_o)
    );

    Mux4to1 #(
    .WIDTH(16)
    ) addr2_mux(
    .data0(16'h0000),
    .data1({{10{ir[5]}},ir[5:0]}),
    .data2({{7{ir[8]}},ir[8:0]}),
    .data3({{5{ir[10]}},ir[10:0]}),
    .sel(addr2_sel), 
    .out(addr2_mux_o)
    );  //addr2_mux
endmodule

module Mux2to1 #(
    parameter WIDTH = 16
)(
    input logic [WIDTH-1:0] data0, 
    input logic [WIDTH-1:0] data1, 
    input logic sel, 
    output logic [WIDTH-1:0] out 
);
always_comb begin
    out = sel ? data1 : data0;
end

endmodule

module Mux4to1 #(
    parameter WIDTH = 16 
)(
    input logic [WIDTH-1:0] data0, 
    input logic [WIDTH-1:0] data1, 
    input logic [WIDTH-1:0] data2, 
    input logic [WIDTH-1:0] data3,
    input logic [1:0] sel, 
    output logic [WIDTH-1:0] out 
);

    always_comb begin
        case(sel)
            2'b00: begin
            out = data0;
            end
            2'b01: begin
            out = data1;
            end
            2'b10: begin
            out = data2;
            end
            2'b11: begin
            out = data3;
            end
            default: out = {WIDTH{1'b0}};
    endcase
    end
endmodule

module pc_mux(
    input logic [1:0] pcmux,
    input logic [15:0] bus,
    input logic [15:0] pc,
    input logic [15:0] adder_o,

    output logic [15:0] pc_mux_o
);
    always_comb begin
        case(pcmux)
            2'b01: 
            begin
            pc_mux_o = bus;
            end
            2'b00: 
            begin
            pc_mux_o = pc + 1;
            end
            2'b10:
            begin
            pc_mux_o = adder_o;
            end
            default: pc_mux_o = 16'b0;
        endcase
    end
endmodule

module mio_mux(
    input logic mio_en,

    input logic [15:0] bus,
    input logic [15:0] rdata,

    output logic [15:0] mio_mux_o
);
    always_comb begin
        case(mio_en)
            1: mio_mux_o = rdata;
            0: mio_mux_o = bus;
            default: mio_mux_o = 16'b0;
        endcase
    end
endmodule