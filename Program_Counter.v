`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 12:06:38 AM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(clk, rst, PC_in, PC_out);
input clk, rst;
input [31:0] PC_in;
output reg [31:0] PC_out;
always @(posedge clk or posedge rst)
begin
if (rst)
PC_out <= 31'b0;
else
PC_out <= PC_in;
end

endmodule
