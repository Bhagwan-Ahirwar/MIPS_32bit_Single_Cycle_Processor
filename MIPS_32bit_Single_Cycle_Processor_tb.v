`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 06:45:17 PM
// Design Name: 
// Module Name: MIPS_32bit_Single_Cycle_Processor_tb
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


module MIPS_32bit_Single_Cycle_Processor_tb;
reg clk, rst;
MIPS_32bit_Single_Cycle_Processor uut(.clk(clk), .rst(rst));
initial begin
clk=0;
rst=1;
#50;
rst=0;
end

always begin
#100 clk=~clk;
end
initial begin
#5000;
$stop;
end




endmodule
