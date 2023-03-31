`timescale 1ns / 1ps

module pc_block(
//input control,
input reset,clk,
output[4:0] reg1,reg2,reg3,
output [31:0] reg_data1,reg_data2,out,pc,
output [31:0] write_data,inst_code,
output zero_flag,control,regwrite,
output [4:0] alu_ctrl,
output [6:0] opcode,func7,
output [2:0] func3
    );
    wire [31:0] pc_incr,pc,inst_code;
    wire [6:0] opcode,func7;
    wire [4:0] reg1,reg2,reg3,alu_ctrl;
    wire [2:0] func3;
    wire [31:0] reg_data1,reg_data2;
    wire control;
    pc_comb comb(control,pc,pc_incr);
    dff d(pc_incr,clk,reset,pc);
    Instruction_mem mem(pc,reset,inst_code);
    instruction_decoder decode(inst_code,opcode,reg1,reg2,reg3,func7,func3);
    RegisterFile registerFile(reg1,reg2,reg3,write_data,reg_data1,reg_data2,out,regwrite,reset);
    control ctrl(opcode,func7,func3,clk,alu_ctrl,control,regwrite);
    ALU alu(reg_data1,reg_data2,alu_ctrl,write_data,zero_flag);
endmodule




//module pc_inc(
//input control,
//input [31:0]pc
//output [31:0]pc_incre
//    );
//wire [31:0]t2;
//reg [31:0]t1;

//dff m1(.d(t1),.clk(clk),.reset(reset),.q(t2));
//    always @(*)
//    begin
//            case (control)
//            1'b0: t1=t2 ;
//            1'b1: t1=t2+32'd4;
//            endcase
//    end
   
//    assign address = t2;
//endmodule
