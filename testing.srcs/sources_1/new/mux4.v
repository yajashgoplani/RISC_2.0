`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2023 04:01:03 PM
// Design Name: 
// Module Name: mux4
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


module mux4(output [31:0] out, input [31:0] in1,in2,in3,in4, input [1:0] ctrl

    );
    
    assign out=(ctrl[1]==1'b0)?((ctrl[0]==1'b0)?in1:in2):((ctrl[0]==1'b0)?in3:in4);
endmodule
