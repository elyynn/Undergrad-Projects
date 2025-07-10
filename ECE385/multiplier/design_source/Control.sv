//Two-always example for state machine

module control (
	input  logic Clk, 
	input  logic Reset,
    input logic Execute,


    output logic clr,
    output logic clr_ld,
    output logic shift_en,
    output logic add_en,
    output logic sub_en
//    output logic [3:0] state
);
logic[4:0] countnext;
    logic[4:0] count; 
// Declare signals curr_state, next_state of type enum
// with enum values of s_start, s_count0, ..., s_done as the state values
// Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
	enum logic [3:0] {
		BEGIN_S,ADD_S,SHIFT_S,SUB_S,HALT_S,CON_S, RESTART_S
	} curr_state, next_state; 
//    assign state = curr_state;
    always_comb begin
        countnext = count;
        add_en = 0;
        shift_en = 0;
        sub_en = 0;
        clr = 0;
        clr_ld= 0;
    case (curr_state)
        BEGIN_S: begin
        clr_ld = Reset;
        countnext = 0;
        end
        ADD_S: begin
            add_en = 1;
        end
        SHIFT_S:begin
            shift_en = 1;
            countnext = count+1;
        end
        SUB_S:begin
            sub_en = 1;
        end
        CON_S: begin
        clr = 1;
        end
        HALT_S: begin
        countnext = 0;
        end
    endcase
    end

// Assign outputs based on state
	always_comb
	begin
		next_state  = curr_state;	//required because I haven't enumerated all possibilities below. Synthesis would infer latch without this
		case (curr_state)
            BEGIN_S :begin
                if (Execute)
//                $display ("begin!!!");
                begin
//                    if (M) begin
                    next_state =  ADD_S;
//                    end
//                    else begin
//                        next_state = SHIFT_S;
//                    end
                end
                
            end
            ADD_S:begin
                    next_state = SHIFT_S;
            end
            SHIFT_S: begin
                if (countnext == 7 ) begin
                    next_state = SUB_S;
                end
                else if (countnext == 8) begin
                    next_state = HALT_S;
                end
                else begin
                    next_state = ADD_S;
                end
//                else begin
//                    next_state = SHIFT_S;
//                end
            end
            SUB_S:begin
                next_state = SHIFT_S;
            end
            HALT_S:begin
                if (~Execute)begin
                    next_state = RESTART_S;
                end
                end
            RESTART_S:begin
                if (Execute)begin
                next_state = CON_S;
            end
            end
            CON_S:begin
                if (Execute)
                begin
                    next_state =  ADD_S;
                end                
            end
        endcase
	end



	//updates flip flop, current state is the only one
	always_ff @(posedge Clk)  
	begin
		if (Reset)
		begin
			curr_state <= BEGIN_S;
		end
		else 
		begin
			curr_state <= next_state;
			count <= countnext;
		end
	end

endmodule
