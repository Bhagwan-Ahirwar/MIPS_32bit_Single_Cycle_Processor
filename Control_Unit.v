`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 01:30:09 AM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(instruction, Branch, Jump, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, RegWrite, ALUOp1, ALUOp2, lu_Write, slti_en);
input [5:0]instruction;
output reg Branch, Jump, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, RegWrite, ALUOp1, ALUOp2,lu_Write, slti_en;

always @ (*)
begin
case (instruction)
//R
6'b000000 : {ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemtoReg, Jump, Branch, ALUOp1, ALUOp2,lu_Write, slti_en} <= 12'b011000001000;
//lw
6'b100011 : {ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemtoReg, Jump, Branch, ALUOp1, ALUOp2,lu_Write, slti_en} <= 12'b101101000000;
//sw
6'b101011 : {ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemtoReg, Jump, Branch, ALUOp1, ALUOp2,lu_Write, slti_en} <= 12'b100010000000;
//beq
6'b000100 : {ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemtoReg, Jump, Branch, ALUOp1, ALUOp2,lu_Write, slti_en} <= 12'b000000010100;
//bne
6'b000101 : {ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemtoReg, Jump, Branch, ALUOp1, ALUOp2,lu_Write, slti_en} <= 12'b000000010100;
//jump
6'b000010 : {ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemtoReg, Jump, Branch, ALUOp1, ALUOp2,lu_Write, slti_en} <= 12'b000000100000;
//lui
6'b001111 : {ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemtoReg, Jump, Branch, ALUOp1, ALUOp2,lu_Write, slti_en} <= 12'b001000000010;
//slti
6'b001010 : {ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemtoReg, Jump, Branch, ALUOp1, ALUOp2,lu_Write, slti_en} <= 12'b101000001101;
endcase
end

endmodule
