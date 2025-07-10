module ALU(input logic [15:0] SR2MUX_OUT, 
            input logic [15:0] SR1_OUT,
			input logic [1:0] ALUK,
			output logic [15:0] ALU_OUT
			);			  
		always_comb
			begin
				unique case (ALUK)				
					2'b00 : ALU_OUT = SR2MUX_OUT + SR1_OUT;
					2'b01 : ALU_OUT = SR2MUX_OUT & SR1_OUT;
					2'b10 : ALU_OUT = ~SR1_OUT;
					2'b11 : ALU_OUT = SR1_OUT;
//					default: ALU_OUT = 16'b0;
				endcase
			end
endmodule 