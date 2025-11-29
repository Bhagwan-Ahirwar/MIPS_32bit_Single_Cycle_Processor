`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 02:00:28 AM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(MemWrite, MemRead, read_address, Write_data, MemData_out);
input MemWrite, MemRead;
input [31:0]read_address, Write_data ;
output reg [31:0]MemData_out;
integer i;
reg [7:0] D_Memory [0:1095];
initial
begin
D_Memory[0] = 8'b00000000;
D_Memory[1] = 8'b00000000;
D_Memory[2] = 8'b00000000;
D_Memory[3] = 8'b00011100;

D_Memory[4] = 8'b00000000;
D_Memory[5] = 8'b00000000;
D_Memory[6] = 8'b00000000;
D_Memory[7] = 8'b00000010;

D_Memory[8] = 8'b00000000;
D_Memory[9] = 8'b00000000;
D_Memory[10] = 8'b00000000;
D_Memory[11] = 8'b00000000;

D_Memory[12] = 8'b00000000;
D_Memory[13] = 8'b00000000;
D_Memory[14] = 8'b00000000;
D_Memory[15] = 8'b00000000;

D_Memory[24] = 8'b00000000;
D_Memory[25] = 8'b00000000;
D_Memory[26] = 8'b00000000;
D_Memory[27] = 8'b00101100;

end
 always @ (MemWrite or read_address or MemRead) begin
 if(MemWrite && ~MemRead) begin
{D_Memory[read_address], D_Memory[read_address+32'd1], D_Memory[read_address+32'd2], D_Memory[read_address+32'd3]} <= Write_data;
end
end
 always @ (*) begin
 if(MemRead && ~MemWrite) begin
MemData_out = {D_Memory[read_address], D_Memory[read_address+32'd1], D_Memory[read_address+32'd2], D_Memory[read_address+32'd3]}; 
end else begin
MemData_out = 32'b00;
end
end

endmodule
