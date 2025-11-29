`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 01:48:30 AM
// Design Name: 
// Module Name: Branch_ALU
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


module Branch_ALU(in_1, in_2, Sum_out);
input [31:0]in_1, in_2;
output [31:0]Sum_out;
assign Sum_out = in_1 + in_2;
endmodule
