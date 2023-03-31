`timescale 1ns / 1ps
module RegisterFile(
    input [4:0] read_reg_num1,
    input [4:0] read_reg_num2,
    input [4:0] write_reg,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2,
    output [31:0] out,
    input regwrite,
    input reset
);

    reg [31:0] reg_memory [31:0]; // 32 memory locations each 32 bits wide
    integer i;

    //  When reset is triggered, we initialize the registers with some values
    always @(negedge reset)
    begin
        // Bear with me for now, I tried using loops, but it won't work
        // Just duct-taping this for now
        for(i=0;i<32;i=i+1)
        begin
            reg_memory[i]=i;
        end    

    end

    // The register file will always output the vaules corresponding to read register numbers 
    // It is independent of any other signal
    assign read_data1 = reg_memory[read_reg_num1];
    assign read_data2 = reg_memory[read_reg_num2];

    // If clock edge is positive and regwrite is 1, we write data to specified register
    always @(*)
    begin
        if (regwrite) begin
            reg_memory[write_reg] = write_data;
        end     
    end
    assign out=reg_memory[write_reg];
endmodule