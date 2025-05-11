`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2025 06:09:13 PM
// Design Name: 
// Module Name: carrySave
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


module carrySave(input clk, rst, x , y , output reg sum);
wire HSUM1;
reg SC; 
assign HSUM1 = y ^ SC;
assign hco1 = y & SC;
wire hsum2, hco2;
assign hsum2 = x ^ HSUM1;
assign hco2 = x & HSUM1;

always @ (posedge clk or posedge rst) begin 
    if (rst) begin
    sum <= 1'b0; 
    SC <= 1'b0;
    end 
else begin

sum <= hsum2;
SC <= hco1 ^ hco2;

end

end

endmodule
