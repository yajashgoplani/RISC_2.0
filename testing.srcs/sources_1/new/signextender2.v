`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2023 11:09:57 AM
// Design Name: 
// Module Name: signextender2
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


module signextender2(input [11:0] imm, output [31:0] imm_out

    );
    assign imm_out={{20{imm[11]}},imm};
endmodule
