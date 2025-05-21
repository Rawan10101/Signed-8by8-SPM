`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 08:25:33 PM
// Design Name: 
// Module Name: compar
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


module compar(
input [3:0] Q,
input const,
output reg outt
    );
    always @(*) begin
    if(Q!=const)
    outt=0;
    else
    outt=1;
    end
endmodule
