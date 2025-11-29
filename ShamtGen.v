`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 06:16:44 PM
// Design Name: 
// Module Name: ShamtGen
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


module ShamtGen(Opcode, instruction, shamtExt);
input [5:0] Opcode;
input [4:0] instruction;
output reg [31:0] shamtExt;

always @(*) begin
      case(Opcode)
      6'b000000 : shamtExt =  {{27{0}}, instruction [4:0]};   //sll 
          
     default : shamtExt = 32'b0;
     endcase
end

endmodule
