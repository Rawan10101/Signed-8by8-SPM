`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 04:53:51 PM
// Design Name: 
// Module Name: add_3
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


module add_3(
input [3:0] a,
output reg [3:0] s
    );
    always @* begin
    if (a<=4)
    s=a;
    else
    s=a+3;
    end
    
endmodule
