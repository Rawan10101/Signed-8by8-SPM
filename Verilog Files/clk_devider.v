`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 08:38:32 PM
// Design Name: 
// Module Name: clk_devider
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


module clk_devider #(parameter n = 50000000)
(input clk, rst,en, output reg clk_out);
wire [31:0] count;
// Big enough to hold the maximum possible value
// Increment count
counter #(32,n) counterMod
(.clk(clk),.en(en), .reset(rst), .count(count));
// Handle the output clock
always @ (posedge clk, posedge rst) begin
if (rst) // Asynchronous Reset
clk_out <= 0;
else if (count == n-1)
clk_out <= ~ clk_out;
end
endmodule
