module reg_A (
	input  logic	    clk, 
	input  logic	    clr_ld, shift_en, add_en, sub_en, clr,
	input  logic [7:0] s,
	input  logic M,

    output logic x,
	output logic [7:0] data_q
);

    logic [7:0] Data_Next;
    logic X_val;
    logic [8:0] sum, diff;
    logic [8:0] add_val_1, add_val_2;
    
    assign add_val_1 = {Data_Next[7], Data_Next};
    assign add_val_2 = {s[7], s};
    
    adder Adder(.a(add_val_1), .b(add_val_2), .cin(0), .s(sum));
    subtractor Subtractor(.a(add_val_1), .b(add_val_2), .s(diff));
    
    always_comb  begin
        data_q = Data_Next;  
    end
    
    always_ff @ (posedge clk)
     begin
        if (clr_ld)             // Synchronous Reset
        begin
            Data_Next <= 8'b0;
            X_val <= 0;
        end
        else if (clr)             // Synchronous Reset
        begin
            Data_Next <= 8'b0;
            X_val<= 0;
        end
        else if (shift_en)
        begin
            Data_Next <= { X_val, data_q[7:1] };
        end
        else if (add_en)
        begin
        if (M)begin
            Data_Next <= sum[7:0];
            X_val <= sum[8];
            end
        else begin
			Data_Next <= data_q;
			X_val <= x;            
        end
        end
        else if (sub_en)
        begin
        if (M)begin        
            Data_Next <= diff[7:0];
            X_val <= diff[8];
             end
        else begin
			Data_Next <= data_q;
			X_val <= x;               
        end
        end
		else
		begin
			Data_Next <= data_q;
		end

    end
	assign x = X_val;
		
endmodule

module reg_B(
	input  logic	    clk, 
	input  logic	    clr_ld, shift_en,
	input  logic [7:0] s, // set input/output size based on parameter
	input  logic shift_input,

	output logic [7:0] data_q,
	output logic M
);

    logic [7:0] Data_Next;
    
    always_ff @ (posedge clk) begin 
        if (clr_ld)             // Synchronous Reset
        begin
            Data_Next <= s;
            end
        else if (shift_en)
        begin
            Data_Next <= { shift_input, data_q[7:1] };
            end
            else
            begin
         Data_Next <= data_q; 
         end
    end
    
    always_comb begin
    data_q = Data_Next;
    end
    
    assign M = data_q[0];

endmodule
