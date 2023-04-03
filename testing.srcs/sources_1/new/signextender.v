`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2023 04:14:05 PM
// Design Name: 
// Module Name: signextender
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


module signextender(input [19:0] imm, output [31:0] imm_out

    );
    wire [31:0] sign_ex;
    assign sign_ex={{12{imm[19]}},imm};
    assign imm_out=sign_ex<<1'b1;
endmodule
