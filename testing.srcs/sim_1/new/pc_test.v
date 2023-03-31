`timescale 1ns / 1ps


module pc_test(

    );
    
    reg clk,reset;//,regwrite;
    //reg control;
    wire [31:0] write_data;
    wire [4:0] reg1,reg2,reg3,alu_ctrl;
    wire [31:0] reg_data1,reg_data2,out,pc,inst_code;
    wire zero_flag,control1,regwrite;
    wire [6:0] opcode,func7;
    wire [2:0] func3;
    pc_block pcc(reset,clk,reg1,reg2,reg3,reg_data1,reg_data2,out,pc,write_data,inst_code,zero_flag,control1,regwrite,alu_ctrl,opcode,func7,func3);
    
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
        #100 $finish;
    end    
endmodule
