`timescale 1ns / 1ps


module pc_test(

    );
    
    reg clk,reset;//,regwrite;
    //reg control;
    wire [31:0] write_data;
    wire [4:0] reg1,reg2,reg3,alu_ctrl;
    wire [31:0] reg_data1,reg_data2,out,pc,inst_code;
    wire zero_flag,regwrite;
    wire [1:0] control1;
    wire [6:0] opcode,func7;
    wire [2:0] func3,alu_op;
    wire [31:0] reg_write;
    wire [1:0] ctrli;
    wire ctrlj;
    wire [31:0] shamt;
    pc_block pcc(reset,clk,reg1,reg2,reg3,reg_data1,reg_data2,out,pc,write_data,inst_code,zero_flag,
    regwrite,control1,alu_ctrl,opcode,func7,func3,alu_op,reg_write,ctrli,ctrlj,shamt);
    
    initial 
    begin
        clk=0;
        forever #5 clk=~clk;
    end    
    initial 
    begin
        reset<=1;//control<=1;
        #22 reset=0; //regwrite=0;
        #32 reset=1;//#2 regwrite=1;
       // #5 regwrite<=0;
       // #30 control=0;
        #140 $finish;
    end    
//    wire [31:0] out;
//    reg [19:0] imm;
//    signextender ext(imm,out);
    
//    initial 
//    begin
//       imm=20'hffff8;
//        #10 imm=20'h00008;
//        #10 $finish;
//    end    


endmodule
