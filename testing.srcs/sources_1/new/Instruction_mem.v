`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 11:12:46 PM
// Design Name: 
// Module Name: Instruction_mem
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


module Instruction_mem(
    input [31:0] PC,
    input reset,
    output [31:0] Instruction_Code
    );
    
    
     reg [7:0] Memory [127:0]; // Byte addressable memory with 32 locations

    // Under normal operation (reset = 0), we assign the instr. code, based on PC
    assign Instruction_Code = {Memory[PC+3],Memory[PC+2],Memory[PC+1],Memory[PC]};

    // Initializing memory when reset is one
    always @(reset)
    begin
        if(reset == 0)
        begin
              Memory[3] = 8'h00;
              Memory[2] = 8'h00;
              Memory[1] = 8'h00;
              Memory[0] = 8'h00;
//            // Setting 32-bit instruction: add t1, s0,s1 => 0x00940333 
              Memory[7] = 8'h00;
              Memory[6] = 8'h94;
              Memory[5] = 8'h03;
              Memory[4] = 8'h33;
//            Or Operation
              Memory[11] = 8'h00;
              Memory[10] = 8'h34;
              Memory[9] = 8'he4;
              Memory[8] = 8'h33;  
//            sub operation
              Memory[15] = 8'h40;
              Memory[14] = 8'h34;
              Memory[13] = 8'h84;
              Memory[12] = 8'h33;
//            sll Operation
              Memory[19] = 8'h00;
              Memory[18] = 8'h34;
              Memory[17] = 8'h94;
              Memory[16] = 8'h33;     
//            slt Operation
              Memory[23] = 8'h00;
              Memory[22] = 8'h34;
              Memory[21] = 8'ha4;
              Memory[20] = 8'h33; 
//            xor Operation
              Memory[27] = 8'h00;
              Memory[26] = 8'h34;
              Memory[25] = 8'hc4;
              Memory[24] = 8'h33; 
//            SRL Operation
              Memory[31] = 8'h00;
              Memory[30] = 8'h34;
              Memory[29] = 8'hd4;
              Memory[28] = 8'h33;     
//            and Operation
              Memory[35] = 8'h00;
              Memory[34] = 8'h34;
              Memory[33] = 8'hf4;
              Memory[32] = 8'h33;
              
              // jal Operation
              Memory[39] = 8'h01;
              Memory[38] = 8'h00;
              Memory[37] = 8'h03;
              Memory[36] = 8'hEF;    
//            No Operation
              Memory[43] = 8'h00;
              Memory[42] = 8'h00;
              Memory[41] = 8'h00;
              Memory[40] = 8'h7f;              
              
              // add Operation
              Memory[55] = 8'h00;
              Memory[54] = 8'h94;
              Memory[53] = 8'h03;
              Memory[52] = 8'h33;
              
              //addi operation
              Memory[59] = 8'h00;
              Memory[58] = 8'h24;
              Memory[57] = 8'hd4;
              Memory[56] = 8'h13;              
              
              
//            No Operation
              Memory[63] = 8'h00;
              Memory[62] = 8'h00;
              Memory[61] = 8'h00;
              Memory[60] = 8'h7f;                 
//            // Setting 32-bit instruction: sub t2, s2, s3 => 0x413903b3
//            Memory[7] = 8'h41;
//            Memory[6] = 8'h39;
//            Memory[5] = 8'h03;
//            Memory[4] = 8'hb3;
//            // Setting 32-bit instruction: mul t0, s4, s5 => 0x035a02b3
//            Memory[11] = 8'h03;
//            Memory[10] = 8'h5a;
//            Memory[9] = 8'h02;
//            Memory[8] = 8'hb3;
//            // Setting 32-bit instruction: xor t3, s6, s7 => 0x017b4e33
//            Memory[15] = 8'h01;
//            Memory[14] = 8'h7b;
//            Memory[13] = 8'h4e;
//            Memory[12] = 8'h33;
//            // Setting 32-bit instruction: sll t4, s8, s9
//            Memory[19] = 8'h01;
//            Memory[18] = 8'h9c;
//            Memory[17] = 8'h1e;
//            Memory[16] = 8'hb3;
//            // Setting 32-bit instruction: srl t5, s10, s11
//            Memory[23] = 8'h01;
//            Memory[22] = 8'hbd;
//            Memory[21] = 8'h5f;
//            Memory[20] = 8'h33;
//            // Setting 32-bit instruction: and t6, a2, a3
//            Memory[27] = 8'h00;
//            Memory[26] = 8'hd6;
//            Memory[25] = 8'h7f;
//            Memory[24] = 8'hb3;
//            // Setting 32-bit instruction: or a7, a4, a5
//            Memory[31] = 8'h00;
//            Memory[30] = 8'hf7;
//            Memory[29] = 8'h68;
//            Memory[28] = 8'hb3;
        end
    end

endmodule
