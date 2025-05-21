`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 04:39:59 PM
// Design Name: 
// Module Name: CSADD
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

module CSADD(input clk_i, rst_i, x_i , y_i , output reg sum_o);
wire HSUM1_w;
reg SC; 
assign HSUM1_w = y_i ^ SC;
assign hco1_w = y_i & SC;
wire hsum2_w, hco2_w;
assign hsum2_w = x_i ^ HSUM1_w;
assign hco2_w = x_i & HSUM1_w;

always @ (posedge clk_i or posedge rst_i) begin 
    if (rst_i) begin
    sum_o <= 1'b0; 
    SC <= 1'b0;
    end 
else begin

sum_o <= hsum2_w;
SC <= hco1_w ^ hco2_w;

end

end
endmodule
