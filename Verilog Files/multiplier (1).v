`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2025 11:14:39 PM
// Design Name: 
// Module Name: multiplier
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


module multiplier(input clk_i, input rst_i, input [7:0] x_i, input y_i, output product_o );

wire [7:1] partialProducts_w;
CSADD cs0 (clk_i, rst_i, x_i[0] & y_i , partialProducts_w[1],  product_o);
//anding between y that is coming from the shift in the FSM, and the relevant X to be inputted to the carry save adder.
genvar j; 
generate for (j=1; j < 7 ; j=j+1)begin
        CSADD adder(clk_i,rst_i,  x_i[j] & y_i ,  partialProducts_w[j+1], partialProducts_w[j] );
end
endgenerate 

TCMP twoComp (clk_i, (x_i[7] & y_i), rst_i, partialProducts_w[7]);
endmodule
