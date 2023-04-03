`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2023 12:28:21 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
input clock,
input [31:0]address,
input [31:0]write_data,
input MemWrite,
input MemRead,
output reg [31:0]Data
    );
    reg [7:0] memory[127:0];   // byte organised memory with 129 locations
    integer i;
       
    initial 
    begin
         
          for(i=0;i<32;i=i+1)  
                memory[i]=32'd0;
    end
           
    always @(posedge clock)begin
        if (MemWrite == 1)
            memory[address] <= write_data;
           end
    always @(*) begin
        if(MemRead==1)
            Data = memory[address];
    end
   
endmodule
