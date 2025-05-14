`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 05:30:19 PM
// Design Name: 
// Module Name: main
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


module main(
input clk,
input [7:0] x,
input [7:0]y,
input muxsel,
input rst,
output [15:0] p
    );
    
    wire [15:0] y_ext;
    wire clkout;
    wire load;
    wire serial_out;
    wire [15:0] out_nn;
    assign load= (mux)? 1'b0:1'b1;
    assign y_ext = {{8{y[7]}}, y};
   
   right_register shift(clkout, load ,1'b0, y_ext, out_nn, serial_out);
   wire serial_out2= {{8{serial_out}}};
   wire reg [7:0] outand;
   always @ (posedge clkout or rst) begin
   outand= serial_out2 & x;
    end
    wire [7:0] S;
  TCMP tcmp ( clkout,outand [7],rst, S[0]);
  CSADD csadd1 (clkout, rst,outand[6], S[0], S[1]);
  CSADD csadd1 (clkout, rst,outand[5], S[1], S[2]);
  CSADD csadd1 (clkout, rst,outand[4], S[2], S[3]);
  CSADD csadd1 (clkout, rst,outand[3], S[3], S[4]);
  CSADD csadd1 (clkout, rst,outand[2], S[4], S[5]);
  CSADD csadd1 (clkout, rst,outand[1], S[5], S[6]);
   CSADD csadd1 (clkout, rst,outand[0], S[6], S[7]);
      wire [15:0] out_n;
       wire serial_n;
  wire [3:0] count;
 counter  # (4,11) count(clkout, rst, 1'b1, count);
wire out;
  compar comp(count, 4'd11, out); 
  wire outnot=~out;
  right_register shift(clkout, 1'b0 , outnot, 1'b0 ,out_n, serial_n);


              
endmodule
