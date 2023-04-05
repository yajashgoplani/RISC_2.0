`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2023 01:26:27 AM
// Design Name: 
// Module Name: alu_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies:   
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_control(
    input [2:0] alu_op,func3,
    input func7,
    output reg [4:0] alu_ctrl
    );
    always @(alu_op,func3,func7)
    begin
        if(alu_op==3'b000)
        begin
            case({func7,func3})
            4'b0000: alu_ctrl=5'b00010;   //add
            4'b1000: alu_ctrl=5'b00100;   //sub
            4'b0001: alu_ctrl=5'b00011;   //sll
            4'b0010: alu_ctrl=5'b01000;   //slt
            4'b0100: alu_ctrl=5'b00111;   //xor
            4'b0101: alu_ctrl=5'b00101;   //srl
            4'b0111: alu_ctrl=5'b00000;   //and
            4'b0110: alu_ctrl=5'b00001;   //or
            4'b1101: alu_ctrl=5'b01001;   //SRA
            endcase;
        end
        else if(alu_op==3'b001)
        begin
            alu_ctrl=5'b00010;
        end    
        else if(alu_op==3'b010)
        begin
        case(func3)
            3'b000: alu_ctrl=5'b00010;   //add
            3'b010: alu_ctrl=5'b01000;   //slt
            3'b100: alu_ctrl=5'b00111;   //xor
            3'b111: alu_ctrl=5'b00000;   //and
            3'b110: alu_ctrl=5'b00001;   //or
            endcase;
        end    
        else if(alu_op==3'b111)
        begin
            alu_ctrl=5'b11111;
        end   
    end          
endmodule
