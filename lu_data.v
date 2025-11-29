`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 04:53:22 PM
// Design Name: 
// Module Name: lu_data
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


module lu_data(instruction, lu_out);
input [31:0]instruction;
output [31:0]lu_out;

assign lu_out = {{instruction[15:0]}, 16'b0};

endmodule
