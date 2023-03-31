`timescale 1ns / 1ps


module pc_comb(
input control,
input [31:0]pc,
output [31:0]pc_incre
    );
    assign pc_incre=(control==1)?(pc+32'h00000004):(pc);
endmodule    
