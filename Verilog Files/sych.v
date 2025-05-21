`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 09:06:22 AM
// Design Name: 
// Module Name: sych
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

module sych(
    input clk,
    input sig1,
    output reg sig2
);
reg meta;

always @(posedge clk)begin
    meta<=sig1;
    sig2<= meta;
end
endmodule
