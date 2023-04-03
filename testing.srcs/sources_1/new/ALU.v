`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 11:18:00 AM
// Design Name: 
// Module Name: ALU
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

module ALU (
    input [31:0] in1,in2, 
    input[4:0] alu_control,
    output reg [31:0] alu_result,
    output reg zero_flag
);
    always @(*)
    begin
        // Operating based on control input
        case(alu_control)

        5'b00000: alu_result = in1&in2;
        5'b00001: alu_result = in1|in2;
        5'b00010: alu_result = in1+in2;
        5'b00100: alu_result = in1-in2;
        5'b01000: begin 
            if(in1<in2)
            alu_result = 32'h00000001;
            else
            alu_result = 32'h00000000;
        end  
        5'b00011: alu_result = in1<<in2;
        5'b00101: alu_result = in1>>in2;
        5'b00110: alu_result = in1*in2;
        5'b00111: alu_result = in1^in2;
        5'b11111: alu_result= 32'hZZZZZZZZ;
        5'b01001: alu_result = in1>>>in2;
        endcase
        
        // Setting Zero_flag if ALU_result is zero
        if (alu_result == 0)
            zero_flag = 1'b1;
        else
            zero_flag = 1'b0;
        
    end
endmodule
