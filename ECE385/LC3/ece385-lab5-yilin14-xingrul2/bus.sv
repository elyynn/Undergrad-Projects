module bus(
    input logic gate_marmux,
    input logic gate_pc,
    input logic gate_alu,
    input logic gate_mdr,// all four control signal for bus

    input logic [15:0] mdr,
    input logic [15:0] pc,
    input logic [15:0] aluk_out,
    input logic [15:0] marmux_out,

    output logic [15:0] bus
);
logic [3:0] bus_control;
assign bus_control = {gate_pc, gate_mdr, gate_alu, gate_marmux};

always_comb
begin
    case(bus_control)
            4'b0100: bus = mdr;
            4'b1000: bus = pc;
            4'b0010: bus = aluk_out;
            4'b0001: bus = marmux_out;
            default: bus = 16'b0;
        endcase
end
endmodule