`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 12:08:52 AM
// Design Name: 
// Module Name: PCplus4
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


module PCplus4 (fromPC, NextPC);
input [31:0] fromPC;
output [31:0] NextPC;
assign NextPC = fromPC+4;
endmodule
