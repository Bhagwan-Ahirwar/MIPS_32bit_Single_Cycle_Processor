`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 12:11:18 AM
// Design Name: 
// Module Name: Instruction_Mem
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


module Instruction_Mem(read_address, instruction_out);
input [31:0] read_address;
output reg [31:0] instruction_out;
reg [7:0]I_Mem[0:4095];
initial
begin
//lw r4 0(r3) 
I_Mem[0] = 8'b10001100;
I_Mem[1] = 8'b01100100;
I_Mem[2] = 8'b00000000;
I_Mem[3] = 8'b00000000;
//lw r5 1(r3) 
I_Mem[4] = 8'b10001100;
I_Mem[5] = 8'b01100101;
I_Mem[6] = 8'b00000000;
I_Mem[7] = 8'b00000100;
//add r6 r4 r5
I_Mem[8] = 8'b00000000;
I_Mem[9] = 8'b10000101;
I_Mem[10] = 8'b00110000;
I_Mem[11] = 8'b00100000;
//sw r6 8(r3)
I_Mem[12] = 8'b10101100;
I_Mem[13] = 8'b01100110;
I_Mem[14] = 8'b00000000;
I_Mem[15] = 8'b00001000;
//sub r7 r4 r5
I_Mem[16] = 8'b00000000;
I_Mem[17] = 8'b10000101;
I_Mem[18] = 8'b00111000;
I_Mem[19] = 8'b00100010;
//sw r7 12(r3)
I_Mem[20] = 8'b10101100;
I_Mem[21] = 8'b01100111;
I_Mem[22] = 8'b00000000;
I_Mem[23] = 8'b00001100;

//and r8 r4 r5
I_Mem[24] = 8'b00000000;
I_Mem[25] = 8'b10000101;
I_Mem[26] = 8'b01000000;
I_Mem[27] = 8'b00100100;

//sw r8 16(r3)
I_Mem[28] = 8'b10101100;
I_Mem[29] = 8'b01101000;
I_Mem[30] = 8'b00000000;
I_Mem[31] = 8'b00010000;

//or r9 r4 r5
I_Mem[32] = 8'b00000000;
I_Mem[33] = 8'b10000101;
I_Mem[34] = 8'b01001000;
I_Mem[35] = 8'b00100101;

//sw r9 20(r3)
I_Mem[36] = 8'b10101100;
I_Mem[37] = 8'b01101001;
I_Mem[38] = 8'b00000000;
I_Mem[39] = 8'b00010100;



//lui

I_Mem[40] = 8'b00111100;
I_Mem[41] = 8'b00001011;
I_Mem[42] = 8'b00000000;
I_Mem[43] = 8'b00000001;


//slt r10 r4 r5
I_Mem[44] = 8'b00000000;
I_Mem[45] = 8'b10000101;
I_Mem[46] = 8'b01010000;
I_Mem[47] = 8'b00101010;

//slt r10 r5 r4
I_Mem[48] = 8'b00000000;
I_Mem[49] = 8'b10100100;
I_Mem[50] = 8'b01010000;
I_Mem[51] = 8'b00101010;

//lui r11 1
I_Mem[52] = 8'b00111100;
I_Mem[53] = 8'b00001011;
I_Mem[54] = 8'b00000000;
I_Mem[55] = 8'b00000001;

//slti r15 r9 33
I_Mem[56] = 8'b00101001;
I_Mem[57] = 8'b00101111;
I_Mem[58] = 8'b00000000;
I_Mem[59] = 8'b00100001;

/*
//beq
I_Mem[60] = 8'b00010000;
I_Mem[61] = 8'b11001001;
I_Mem[62] = 8'b00000000;
I_Mem[63] = 8'b00000010;
*/
//sw
I_Mem[60] = 8'b10001100;
I_Mem[61] = 8'b01111111;
I_Mem[62] = 8'b00000000;
I_Mem[63] = 8'b00011000;

//sll
I_Mem[64] = 8'b00000000;
I_Mem[65] = 8'b00001001;
I_Mem[66] = 8'b10000001;
I_Mem[67] = 8'b00000000;


//jr
I_Mem[68] = 8'b00000000;
I_Mem[69] = 8'b10000000;
I_Mem[70] = 8'b00000000;
I_Mem[71] = 8'b00001000;

/*
//jump
I_Mem[68] = 8'b00001000;
I_Mem[69] = 8'b00000000;
I_Mem[70] = 8'b00000000;
I_Mem[71] = 8'b00000010;

//bne
I_Mem[68] = 8'b00010100;
I_Mem[69] = 8'b11000111;
I_Mem[70] = 8'b00000000;
I_Mem[71] = 8'b00000010;
*/
end
always @ (*)
begin
instruction_out = {I_Mem[read_address], I_Mem[read_address+32'd1], I_Mem[read_address+32'd2], I_Mem[read_address+32'd3]};
end

endmodule
