`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 08:18:09 PM
// Design Name: 
// Module Name: ALU
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

module ALU (
    input clk_i,
    input rst_i,
    input start_i,         
    input [7:0] A_i,
    input [7:0] B_i,
    output reg signed [15:0] sum_o,
    output reg signed [15:0] diff_o,
    output reg [15:0] prod_o,
    output reg [7:0] xor_out_o,
    output reg [7:0] and_out_o,
    output reg done_o       
);

    wire spm_done_w;
    wire [15:0] spm_out_w;

    FSM spm_inst (
        clk_i,
       rst_i,
       start_i,
       A_i,
        B_i,
        spm_out_w,
        spm_done_w
    );

    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            sum_o <= 0;
            diff_o <= 0;
            prod_o <= 0;
            xor_out_o <= 0;
            and_out_o <= 0;
            done_o <= 0;
        end else begin
            sum_o <= $signed(A_i) + $signed(B_i);
            diff_o <= $signed(A_i) - $signed(B_i);
            xor_out_o <= A_i ^ B_i;
            and_out_o <= A_i & B_i;

            if (spm_done_w) begin
                prod_o <= spm_out_w;
                done_o <= 1;
            end else begin
                done_o <= 0;  
            end
        end
    end

endmodule
