module reg_file(
    input  logic	    		  clk, 
	input  logic	    		  reset, 
	input  logic	    		  load,
    input  logic [2:0] DR_index,
    input  logic [2:0] SR1_index,
    input  logic [2:0] SR2_index,
	input  logic [15:0] bus_in, 

	output logic [15:0] SR1_O,
	output logic [15:0] SR2_O
);

logic [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
//logic [15:0] reg_file[8];
always_comb begin
//    SR1_O = reg_file[SR1_index];
    unique case (SR1_index)
        3'b000: SR1_O =  R0;
        3'b001: SR1_O =  R1;
        3'b010: SR1_O =  R2;
        3'b011: SR1_O =  R3;
        3'b100: SR1_O =  R4;
        3'b101: SR1_O =  R5;
        3'b110: SR1_O =  R6;
        3'b111: SR1_O =  R7;
    endcase
        unique case (SR2_index)
        3'b000: SR2_O =  R0;
        3'b001: SR2_O =  R1;
        3'b010: SR2_O =  R2;
        3'b011: SR2_O =  R3;
        3'b100: SR2_O =  R4;
        3'b101: SR2_O =  R5;
        3'b110: SR2_O =  R6;
        3'b111: SR2_O =  R7;
    endcase
end

always_ff @(posedge clk) begin
    if (load) begin
        unique case (DR_index)
        3'b000: R0 <= bus_in;
        3'b001: R1 <= bus_in;
        3'b010: R2 <= bus_in;
        3'b011: R3 <= bus_in;
        3'b100: R4 <= bus_in;
        3'b101: R5 <= bus_in;
        3'b110: R6 <= bus_in;
        3'b111: R7 <= bus_in;
        endcase 
    end
    if (reset) begin
        R0 <= 16'b0;
        R1 <= 16'b0;
        R2 <= 16'b0;
        R3 <= 16'b0;
        R4 <= 16'b0;
        R5 <= 16'b0;
        R6 <= 16'b0;
        R7 <= 16'b0;
    end
end
endmodule