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
input clk, A, rst,
output reg S
    );
    wire Z,d1,d2;
    assign d1=A^Z;
    assign FDHA= A&Z;
    assign d2= A|Z;
    always @ (posedge clk or posedge rst) begin 
    if (rst) begin
    S <= 1'b0; 
    Z <= 1'b0;
    end 
    else begin
    S<=d1;
    Z=d2;
    end 
    end 
endmodule
