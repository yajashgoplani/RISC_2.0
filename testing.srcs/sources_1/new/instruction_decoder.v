`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 11:38:32 PM
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder(
    input [31:0] instruct,output [6:0] opcode, [4:0] reg1,[4:0] reg2, [4:0] reg3,[6:0] func7,[2:0] func3,[19:0] imm_j
    );
    assign opcode=instruct[6:0];
    assign reg3= instruct[11:7];
    assign func3= instruct[14:12];
    assign reg1= instruct[19:15];
    assign reg2= instruct[24:20];
    assign func7= instruct[31:25];
    assign imm_j= {instruct[31],instruct[19:12],instruct[20],instruct[30:21]};
endmodule
