`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 01:55:35 AM
// Design Name: 
// Module Name: AND_logic
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


module AND_logic(branch, Zero, and_out);
input branch, Zero;
output and_out;

assign and_out = branch & Zero;
endmodule
