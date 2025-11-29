`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Indian Institute of Technology, Jammu
// Engineer: Bhagwan Das Ahirwar
// 
// Create Date: 04/07/2025 02:13:13 AM
// Design Name: Bhagwan Das Ahirwar
// Module Name: MIPS_32bit_Single_Cycle_Processor
// Project Name: MIPS_32bit_Single_Cycle_Processor
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


module MIPS_32bit_Single_Cycle_Processor(clk, rst);
input clk, rst;
wire [31:0] PC_top, instruction_top, Shift2,read_data1_top, read_data2_top, mux1_top, Shiftby2_top, Sum_out_top, NextPC_top, BEQ_Mux_out, jump_address_top, PCin_top, ALU_Result_top, MemData_out_top, Writeback_top, MemData_out_top1, lu_mux_out, PCin_top_jump, sll_mux_top, Mux10_out_top, shamtExt_top,
lu_out_top;

wire [27:0] Jump_optoadd;
wire RegWrite_top, ALUOp1_top, ALUOp2_top, ALUSrc_top, Branch_top, Zero_top, Jump_top, and_out_top, MemtoReg_top, MemWrite_top, MemRead_top, RegDst_top, lu_Write_top, slti_en_top, jr_en_top, ALUSrc1_top, Zero_top_in;
wire [3:0]ALU_controp_top;
wire [4:0]Rd_top;

//PC
Program_Counter PC (.clk(clk), .rst(rst), .PC_in(PCin_top), .PC_out(PC_top));
//PC Adder
PCplus4 PC_Adder (.fromPC(PC_top), .NextPC(NextPC_top));
//Instruction Memory 
Instruction_Mem Inst_Memory (.read_address(PC_top), .instruction_out(instruction_top));

//Register file
Reg_File Reg_File (.clk(clk), .rst(rst), .RegWrite(RegWrite_top), .Rs(instruction_top[25:21]), .Rt(instruction_top[20:16]), .Rd(Rd_top), .Write_data_Reg(Writeback_top), .read_data1(read_data1_top), .read_data2(read_data2_top));

//Immediate Generator
ImmGen ImmGen (.Opcode(instruction_top[31:26]), .instruction(instruction_top[15:0]), .ImmExt(Shift2));

//Shift by 2 for branch
shift_2_Branch shift_2_branch (.ImmExt(Shift2), .Shiftby2(Shiftby2_top));

//shift by 2 for jump

shift_2_jump shift_2_jump(.Opcode(instruction_top[25:0]), .Shiftby2_out(Jump_optoadd));

// Jump address

Jump_address Jump_address (.Shiftby2_in(Jump_optoadd), .jumpdes_address(jump_address_top),.PCplus4(NextPC_top));

//Control unit
Control_Unit Control_Unit (.instruction(instruction_top[31:26]), .Branch(Branch_top), .Jump(Jump_top), .RegDst(RegDst_top), .MemtoReg(MemtoReg_top), .MemRead(MemRead_top), .MemWrite(MemWrite_top), .ALUSrc(ALUSrc_top), .RegWrite(RegWrite_top), .ALUOp1(ALUOp1_top), .ALUOp2(ALUOp2_top),.lu_Write(lu_Write_top), .slti_en(slti_en_top));

//ALU Control
ALU_Control ALU_Control (.ALUOp1(ALUOp1_top), .ALUOp2(ALUOp2_top), .function_f(instruction_top[5:0]), .Control_out(ALU_controp_top));

//ALU Unit
ALU_unit ALU_unit(.A(read_data1_top), .B(mux1_top), .C(instruction_top[10:6]),  .Control_in(ALU_controp_top), .ALU_Result(ALU_Result_top), .Zero(Zero_top_in), .jr_en(jr_en_top), .sll_en(ALUSrc1_top));

//ALU mux
Mux1 ALU_Mux(.sel1(ALUSrc_top), .A1(read_data2_top), .B1(Shift2), .Mux1_out(mux1_top));

//ALU beq

Branch_ALU Branch_ALU (.in_1(NextPC_top), .in_2(Shiftby2_top), .Sum_out(Sum_out_top));

//bne & beq
beq_bne beq_bne(.Zero(Zero_top_in), .Opcode(instruction_top[31:26]), .Zero_out(Zero_top));

//And beq

AND_logic AND_logic (.branch(Branch_top), .Zero(Zero_top), .and_out(and_out_top));

//beq MUX
Mux2 BEQ_Mux (.sel2(and_out_top), .A2(NextPC_top), .B2(Sum_out_top), .Mux2_out(BEQ_Mux_out));

//JumpMux

Mux4 Jump_Mux(.sel4(Jump_top), .A4(BEQ_Mux_out), .B4(jump_address_top), .Mux4_out(PCin_top_jump));

//Data Memory

Data_Memory Data_Memory(.MemWrite(MemWrite_top), .MemRead(MemRead_top), .read_address(ALU_Result_top), .Write_data(read_data2_top), .MemData_out(MemData_out_top));

//Memory mux
Mux3 Memory_mux(.sel3(MemtoReg_top), .A3(ALU_Result_top), .B3(MemData_out_top), .Mux3_out(MemData_out_top1));

//Rd Mux
Mux5 Rd_Mux (.sel5(RegDst_top), .A5(instruction_top[20:16]), .B5(instruction_top[15:11]), .Mux5_out(Rd_top));

//lui mux

Mux6  lu_Mux (.sel6(lu_Write_top), .A6(MemData_out_top1), .B6(lu_out_top), .Mux6_out(Writeback_top));

//slti mux
//Mux7 slti_mux (.sel7(slti_en_top), .A7(lu_mux_out), .B7(read_data1_top), .Mux7_out(Writeback_top));

//jr mux

Mux8 jr_mux (.sel8(jr_en_top), .A8(PCin_top_jump), .B8(read_data1_top), .Mux8_out(PCin_top));

//lu data from instruction
lu_data lu_data(.instruction(instruction_top), .lu_out(lu_out_top));

//sll mux
// Mux9 sll_mux (.sel9(ALUSrc1_top), .A9(read_data1_top), .B9(read_data2_top), .Mux9_out(sll_mux_top));

//slli mux1
//Mux10 sll_mux1 (.sel10(ALUSrc1_top), .A10(mux1_top), .B10(shamtExt_top), .Mux10_out(Mux10_out_top));

//sll

// ShamtGen ShamtGen(.Opcode(instruction_top[31:26]), .instruction(instruction_top[10:6]), .shamtExt(shamtExt_top));



endmodule
