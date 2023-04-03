`timescale 1ns / 1ps

module pc_block(
//input control,
input reset,clk,
output[4:0] reg1,reg2,reg3, 

output [31:0] reg_data1,reg_data2,out,pc,
output [31:0] write_data,inst_code,
output zero_flag,regwrite,
output [1:0] control,
output [4:0] alu_ctrl,
output [6:0] opcode,func7,
output [2:0] func3,alu_op,
output [31:0] reg_write,
output [1:0] ctrli,ctrlk,ctrll,
output ctrlj,
output [31:0] shamt,
output read,write,
output [31:0] mem_data,imm_i_ex,load_data

    );
    wire [31:0] pc_incr,pc,inst_code;
    wire [6:0] opcode,func7;
    wire [4:0] reg1,reg2,reg3,alu_ctrl;
    wire [2:0] func3;
    wire [31:0] reg_data1,reg_data2;
    wire [1:0] control;
    wire [19:0] imm_j;
    wire [31:0] imm_j_ex,alu1,alu2,reg_write;
    wire [11:0] imm_i;
    wire [31:0] imm_i_ex;
    pc_comb comb(control,pc,write_data,pc_incr);
    dff d(pc_incr,clk,reset,pc);
    Instruction_mem mem(pc,reset,inst_code);
    instruction_decoder decode(inst_code,opcode,reg1,reg2,reg3,func7,func3,imm_j,imm_i,shamt);
    signextender ex(imm_j,imm_j_ex);
    signextender2 ex2(imm_i,imm_i_ex);
    RegisterFile registerFile(reg1,reg2,reg3,reg_write,reg_data1,reg_data2,out,regwrite,reset);
    control ctrl(opcode,func7,func3,clk,alu_op,control,regwrite,ctrlj,ctrli,ctrlk,ctrll,read,write);
    alu_control alu_ct(alu_op,func3,func7[5],alu_ctrl);
    mux2 m1(alu1,pc,reg_data1,ctrlj);
    mux4 m2(alu2,imm_j_ex,reg_data2,imm_i_ex,shamt,ctrli);
    ALU alu(alu1,alu2,alu_ctrl,write_data,zero_flag);
    DataMemory data_mem(clk,reset,write_data,reg_data2,write,read,mem_data);
    mux4 m4(load_data,{{24{1'b0}},mem_data[7:0]},{{16{1'b0}},mem_data[15:0]},mem_data,32'h0000_0000,ctrll);
    mux4 m3(reg_write,pc+32'h00000004,write_data,load_data,32'h0000_0000,ctrlk);
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