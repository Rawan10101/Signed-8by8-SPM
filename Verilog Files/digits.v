`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 05:03:08 PM
// Design Name: 
// Module Name: digits
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


module digits(
input [3:0] in,
output reg [6:0] segments_a_to_g
);
always @* begin
case(in)
4'b0000: segments_a_to_g = 7'b0000001;
4'b0001: segments_a_to_g = 7'b1001111;
4'b0010: segments_a_to_g = 7'b0010010;
4'b0011: segments_a_to_g = 7'b0000110;
4'b0100: segments_a_to_g = 7'b1001100;
4'b0101: segments_a_to_g = 7'b0100100;
4'b0110: segments_a_to_g = 7'b0100000;
4'b0111: segments_a_to_g = 7'b0001111;
4'b1000: segments_a_to_g = 7'b0000000;
4'b1001: segments_a_to_g = 7'b0000100;
endcase
end
endmodule
