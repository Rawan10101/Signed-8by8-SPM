`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 08:30:18 PM
// Design Name: 
// Module Name: Dflipflop
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

module Dflipflop(
    input clk,      
    input rst,     
    input D,        
    output reg Q    
);

always @(posedge clk) begin
    if (rst)
        Q <= 1'b0;   
    else
        Q <= D;      
end

endmodule