module nzp(
    input logic clk,
    input logic reset,
    input logic [15:0] bus,
    input logic ld_cc,
    input logic ld_ben,
    input logic [2:0] ir9to11,
    output logic BEN
);
logic [2:0] nzp_store;
logic [2:0] nzp_val;
always_comb begin
    if (ld_cc) begin
        if (bus == 16'b0) begin
            nzp_store = 3'b010;
        end else if(bus[15] == 0) begin
            nzp_store = 3'b001;
        end else nzp_store = 3'b100;
    end
    else nzp_store = nzp_val;
end
always_ff @(posedge clk) begin
    nzp_val <= nzp_store;
end

BEN BEN0(.*);
endmodule

module BEN (
    input logic clk,reset,
    input logic ld_ben,
    input logic [2:0] nzp_val, ir9to11,
    output logic BEN
);
logic ben;
always_comb begin
    ben = BEN;
    if (reset) begin
        ben = 0;
    end
    else if(ld_ben) begin
        ben = ir9to11[2]&nzp_val[2] | ir9to11[1]&nzp_val[1] | ir9to11[0] &nzp_val[0];
    end     
end   
always_ff @(posedge clk) begin
    BEN <= ben;
end
endmodule
