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
input clock,reset,
input [31:0]address,
input [31:0]write_data,
input MemWrite,
input MemRead,
output reg [31:0]Data
    );
    reg [31:0] memory[127:0];   
    integer i;
   
    always @(reset)
    begin
        if(reset==1'b0)
        begin
            for(i=0;i<128;i=i+1)  
                memory[i]=32'd0; 
        end 
        memory[0]=32'h1111_1111;
        memory[1]=32'h2222_2222;
        memory[2]=32'h3333_3333;
        memory[3]=32'h4444_4444;
        memory[4]=32'h5555_5555;
        memory[5]=32'h6666_6666;
        memory[6]=32'h7777_7777;
        memory[7]=32'h8888_8888;
        
    end                
    always @(posedge clock)begin
        if (MemWrite == 1)
            memory[address] <= write_data;
           end
    always @(MemRead,address,write_data) begin
        if(MemRead==1)
            Data = memory[address];
        else Data<=32'hZZZZ_ZZZZ;    
    end
   
endmodule
