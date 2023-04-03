`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 11:03:28 AM
// Design Name: 
// Module Name: control
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


module control(
    input [6:0] opcode,func7,
    input[2:0] func3,
    input clk,
    //output reg [4:0] alu_ctrl,output reg control,reg regwrite
    output reg [2:0] alu_op,output reg [1:0] control,
    output reg regwrite,ctrlj,
    output reg [1:0] ctrli
    );
    always@(opcode,func3,func7)
    begin
//        case({func7,func3,opcode})
//        17'h00033: begin alu_ctrl<=5'b00010;control<=1; regwrite=1;  end  //add
//        17'h00333: begin alu_ctrl<=5'b00001; control<=1;regwrite=1; end  // or
//        17'h08033: begin alu_ctrl<=5'b00100; control<=1;regwrite=1; end  // sub
//        17'h000b3: begin alu_ctrl<=5'b00011; control<=1;regwrite=1; end  // sll
//        17'h00133: begin alu_ctrl<=5'b01000; control<=1;regwrite=1; end  // slt
//        17'h00233: begin alu_ctrl<=5'b00111; control<=1;regwrite=1; end  // xor
//        17'h002b3: begin alu_ctrl<=5'b00101; control<=1;regwrite=1; end  // sra
//        17'h003b3: begin alu_ctrl<=5'b00000; control<=1;regwrite=1; end  // xor
//        17'h00000: begin alu_ctrl<=5'b00000;control<=1; regwrite=0; end
//        17'h0007f: begin alu_ctrl<=5'b11111;control<=0; regwrite=0; end 
//        default: begin alu_ctrl<=5'b11111; control<=0;regwrite=0; end
//        endcase
        case(opcode)
        7'b0110011: begin alu_op=3'b000;control<=2'b01;ctrlj<=1'b1;ctrli<=2'b01; regwrite=1; #3 regwrite=0; end
        7'b1101111: begin alu_op=3'b001;control<=2'b10;ctrlj<=1'b0;ctrli<=2'b00; regwrite=1; #3 regwrite=0; end
        7'b0010011: begin
                    if(func3==3'b001 || func3==3'b101)
                            begin
                              alu_op=3'b000;control<=2'b01;ctrlj<=1'b1;ctrli<=2'b11; regwrite=1; #3 regwrite=0; 
                            end
                    else
                    begin 
                           alu_op=3'b010;control<=2'b01;ctrlj<=1'b1;ctrli<=2'b10; regwrite=1; #3 regwrite=0; 
                    end
                    end
                            
        7'b0000000: begin alu_op=3'b111;control<=2'b01;ctrlj<=1'b1;ctrli<=2'b01; regwrite=0; end
        
        default: begin alu_op=3'b111; control<=2'b00;ctrlj<=1'b1;ctrli<=2'b01; regwrite=0; end
        endcase
    end
endmodule
