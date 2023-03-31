`timescale 1ns / 1ps
module dff(
input [31:0]d,
input clk,reset,
output reg [31:0]q);

always @(posedge clk or negedge reset)
   begin
        if (reset == 1'b0)
             q<=32'd0;
        else q<=d;        
    end

endmodule  


