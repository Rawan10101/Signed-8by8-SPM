`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 10:39:00 AM
// Design Name: 
// Module Name: FPGA_INT
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

module FPGA_INT(
    input clk_i, 
    input reset_i, 
    input btnl_i, 
    input btnr_i, 
    input startOperation_i, 
    input [7:0] x_i, y_i,
    output done_o, 
    output reg [6:0] LED_out_o, 
    output reg [3:0] finanode_o
);

// Wire declarations
wire start_w, rst_w, clk_w;
clk_devider #(250_000) clkkk(clk_i, rst_w, 1, clk_w);

detector det (clk_i, startOperation_i, start_w);
detector det1 (clk_i, reset_i, rst_w);

wire [15:0] fout_w, out_w;
FSM SPM (clk_w, rst_w, start_w, x_i, y_i, fout_w, done_o);

wire [18:0] binaryCodedDecimal_w;
assign out_w = (fout_w[15]) ? ~fout_w + 1 : fout_w;
to_bcd bcd(out_w[14:0], binaryCodedDecimal_w);

wire [6:0] led_w[4:0];
digits di1(binaryCodedDecimal_w[3:0], led_w[0]);
digits di2(binaryCodedDecimal_w[7:4], led_w[1]);
digits di3(binaryCodedDecimal_w[11:8], led_w[2]);
digits di4(binaryCodedDecimal_w[15:12], led_w[3]);
digits di5({1'b0, binaryCodedDecimal_w[18:16]}, led_w[4]);

wire [1:0] anode_w;
counter #(2, 4) ano(clk_w, reset_i, 1, anode_w);

// Always block for anode logic
always @* begin
    case(anode_w)
        0: finanode_o = 4'b1110;
        1: finanode_o = 4'b1101;
        2: finanode_o = 4'b1011;
        3: finanode_o = 4'b0111;
    endcase
end

// Button detectors
wire l_w, r_w;
detector det11 (clk_i, btnl_i, l_w);
detector det2  (clk_i, btnr_i, r_w);

// Combined button signal (was unused, so removed if not needed)
// wire btns_w;
// assign btns_w = {l_w, r_w};

// FSM and Display Logic
reg [1:0] state_r, nextState_r;
reg [6:0] Hundreds_r, Tens_r, Ones_r;

always @(posedge clk_w, posedge rst_w) begin
    if (rst_w)
        state_r <= 2'b00;
    else
        state_r <= nextState_r; 
end 

always @* begin
    if (finanode_o == 4'b1110)
        LED_out_o = Ones_r;
    else if (finanode_o == 4'b1101)
        LED_out_o = Tens_r;
    else if (finanode_o == 4'b1011)
        LED_out_o = Hundreds_r;
    else if (finanode_o == 4'b0111)
        LED_out_o = (fout_w[15]) ? 7'b1111110 : 7'b1111111;
end 

always @* begin
    case (state_r)
        2'b00: begin
            if (l_w)       nextState_r = 2'b01;
            else          nextState_r = 2'b00;
            Ones_r    = led_w[0]; Tens_r = led_w[1]; Hundreds_r = led_w[2];
        end
        2'b01: begin
            if (r_w)      nextState_r = 2'b00;
            else if (l_w) nextState_r = 2'b10;
            else          nextState_r = 2'b01;
            Ones_r    = led_w[1]; Tens_r = led_w[2]; Hundreds_r = led_w[3];
        end
        2'b10: begin
            if (r_w)      nextState_r = 2'b01;
            else          nextState_r = 2'b10;
            Ones_r    = led_w[2]; Tens_r = led_w[3]; Hundreds_r = led_w[4];
        end
        default: nextState_r = 2'b00;
    endcase
end

endmodule
