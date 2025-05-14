`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 05:21:24 PM
// Design Name: 
// Module Name: Shift_Register
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

module right_register(
    input clk,             
    input rst,             
    input load,           
    input shift,          
    input [15:0] in,   
    output reg [15:0] out, 
    output reg serial_out   
);

    always @(posedge clk) begin
        if (rst) begin
            out <= 16'b0;
            serial_out <= 1'b0;
        end
        else if (load) begin
            out <= in;
            serial_out <= in[0];
        end
        else if (shift) begin
            serial_out <= out[0];    
            out <= out >> 1;
        end
    end

endmodule
