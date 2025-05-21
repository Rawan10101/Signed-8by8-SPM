`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 08:43:39 PM
// Design Name: 
// Module Name: alu_tb
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

module tb_ALU();

    reg clk;
    reg rst;
    reg start;
    reg [7:0] A, B;
    wire signed [15:0] sum, diff;
    wire [15:0] prod;
    wire [7:0] xor_out, and_out;
    wire done;
    
    initial begin 
clk=1;
forever #5 clk=~clk;

end

    // Instantiate the ALU
    ALU dut (
       clk,
   rst,
     start,
        A,
     B,
     sum,
       diff,
        prod,
        xor_out,
    and_out,
        done
    );

    // Clock generation (100 MHz clock => 10 ns period)
initial begin
start = 1'b1;
#20 
start =1'b0;
end

    initial begin
        rst = 1;
        #10;
        rst = 0;

        A = -8'd23;
        B = 8'd49;
   
    end

endmodule
