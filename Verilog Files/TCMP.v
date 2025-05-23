`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 04:40:58 PM
// Design Name: 
// Module Name: TCMP
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


module TCMP(
input clk_i, A_i, rst_i,
output reg S_o
    );
    reg Z;
    wire d1_w,d2_w;
    assign d1_w=A_i^Z;
    assign FDHA_w= A_i&Z;
    assign d2_w= A_i|Z;
    always @ (posedge clk_i or posedge rst_i) begin 
    if (rst_i) begin
    S_o <= 1'b0; 
    Z <= 1'b0;
    end 
    else begin
    S_o <=  d1_w;
    Z   <=  d2_w;
    end 
    end 
endmodule