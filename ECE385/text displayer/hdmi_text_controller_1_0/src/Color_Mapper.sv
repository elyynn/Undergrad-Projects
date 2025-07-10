//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Zuofu Cheng   08-19-2023                               --
//                                                                       --
//    Fall 2023 Distribution                                             --
//                                                                       --
//    For use with ECE 385 USB + HDMI                                    --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input  logic [9:0]  DrawX, DrawY,
                        input logic [11:0] rgb_fg_1,
                        input logic [11:0] rgb_bg_1,
                        input logic [11:0] rgb_fg_0,
                        input logic [11:0] rgb_bg_0,
                       output logic [3:0]  Red, Green, Blue,
                       output logic [10:0] address_read,
                       input logic [31:0] data_read,
//                       input logic slv_reg_wren,
                       input logic reset );
                       
    
    logic is_char;
    int index;
    int x_index;
    logic [10:0] color_mask;
//    int reg_index;
    logic invert;
    logic [6:0] code;
    logic[5:0] cnt;
    logic [5:0] cnt0;
    assign address_read = ((DrawY/16) * 40 + DrawX/16); //!
    logic [11:0] bg_clr;
    logic [11:0] fg_clr;
//always_ff @( negedge slv_reg_wren )
//begin
//    cnt <= cnt0;
//    cnt0 <= cnt + 1;
//end

//always_comb
//begin
//if (cnt == 7)
//address_read = ((DrawY/16) * 20 + DrawX/32)+1;
//cnt0 = 0;
//end
    
    
//always_ff @( negedge slv_reg_wren )
//begin 
//    cnt <= cnt0 + 1;
//    cnt0 <= cnt0 + 1;
////    address_read <= ((DrawY/16) * 20 + DrawX/32)+1;
//end

//always_comb
//begin
//if (cnt == 30)
//begin
//address_read = ((DrawY/16) * 20 + DrawX/32)+1;
//cnt0 = 0;
//end
//end

//always_comb 
//begin
//if(DrawX == 0)
//begin
//if(DrawY == 0)
//begin
//cnt0 = 0;
//address_read = ((DrawY/16) * 20 + DrawX/32);
//end
//end
//end
    assign x_index = (DrawX%16)/8;  //!
    assign index = code * 16 + DrawY%16;
    always_comb
    begin
    unique case(x_index)
            2'b00: begin 
            code = data_read[14:8];
            invert = data_read[15];
            bg_clr = rgb_bg_0;
            fg_clr = rgb_fg_0;
            end
            2'b01: begin
            code = data_read[30:24];
            invert = data_read[31];
            bg_clr = rgb_bg_1;
            fg_clr = rgb_fg_1;
            end
            endcase
     end 
     
font_rom font_rom0(.addr(index),
				  .data(color_mask)
					 );
   assign is_char = color_mask[7-DrawX%8];
    always_comb
    begin:RGB_Display
        if (((is_char == 1'b1)&(invert == 1'b0 ))|((is_char == 1'b0)&(invert == 1'b1 ))) begin 
            Red = fg_clr[11:8];
            Green = fg_clr[7:4];
            Blue = fg_clr[3:0];
//            Red = 4'h0;
//            Green = 4'h0;
//            Blue = 4'h0;
        end       
        else begin 
            Red = bg_clr[11:8];
            Green = bg_clr[7:4];
            Blue = bg_clr[3:0];
//            Red =4'h7; 
//            Green = 4'h5;
//            Blue = 4'h7;
        end      
    end 
    
endmodule