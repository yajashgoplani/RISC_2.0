`timescale 1ns / 1ps


module pc_comb(
input [1:0] control,
input [31:0]pc,alu_out,
output [31:0]pc_incre
    );
    mux4 m(pc_incre,pc,pc+32'h00000004,alu_out,32'h0,control);
endmodule    
