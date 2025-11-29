`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 02:09:32 AM
// Design Name: 
// Module Name: Mux1
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


module Mux1(sel1, A1, B1, Mux1_out);
input sel1;
input [31:0]A1, B1;
output [31:0]Mux1_out;
assign Mux1_out = (sel1==1'b0) ? A1 : B1;
endmodule

module Mux2(sel2, A2, B2, Mux2_out);
input sel2;
input [31:0]A2, B2;
output [31:0]Mux2_out;

assign Mux2_out = (sel2==1'b0) ? A2 : B2;
 endmodule

module Mux3(sel3, A3, B3, Mux3_out);
input sel3;
input [31:0]A3, B3;
output [31:0]Mux3_out;

assign Mux3_out = (sel3==1'b0) ? A3 : B3;
 endmodule

module Mux4(sel4, A4, B4, Mux4_out);
input sel4;
input [31:0]A4, B4;
output [31:0]Mux4_out;

assign Mux4_out = (sel4==1'b0) ? A4 : B4;
 endmodule

module Mux5(sel5, A5, B5, Mux5_out);
input sel5;
input [4:0]A5, B5;
output [4:0]Mux5_out;

assign Mux5_out = (sel5==1'b0) ? A5 : B5;
 endmodule

module Mux6 (sel6, A6, B6, Mux6_out);
input sel6;
input [31:0]A6, B6;
output [31:0]Mux6_out;

assign Mux6_out = (sel6==1'b0) ? A6 : B6;
 endmodule
 
 module Mux7 (sel7, A7, B7, Mux7_out);
input sel7;
input [31:0]A7, B7;
output [31:0]Mux7_out;

assign Mux7_out = (sel7==1'b0) ? A7 : B7;
 endmodule
 
module Mux8 (sel8, A8, B8, Mux8_out);
input sel8;
input [31:0]A8, B8;
output [31:0]Mux8_out;

assign Mux8_out = (sel8==1'b0) ? A8 : B8;
 endmodule
 
module Mux9 (sel9, A9, B9, Mux9_out);
input sel9;
input [31:0]A9, B9;
output [31:0]Mux9_out;

assign Mux9_out = (sel9==1'b0) ? A9 : B9;
 endmodule
 
 module Mux10 (sel10, A10, B10, Mux10_out);
input sel10;
input [31:0]A10, B10;
output [31:0]Mux10_out;

assign Mux10_out = (sel10==1'b0) ? A10 : B10;
 endmodule
 
 
 
 
 