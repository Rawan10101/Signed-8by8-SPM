`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 08:04:00 PM
// Design Name: 
// Module Name: tb
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

module tb;

  // Inputs
  reg [14:0] bin_d_in;

  // Outputs
  wire [18:0] bcd_d_out;

  // Instantiate the Unit Under Test (UUT)
  to_bcd uut (
    .bin_d_in(bin_d_in),
    .bcd_d_out(bcd_d_out)
  );

  // Task to display results in readable format
  task display_result;
    input [14:0] bin;
    input [18:0] bcd;
    begin
      $display("Binary: %d --> BCD: %0d%0d%0d%0d%0d",
        bin,
        bcd[18:15], bcd[14:11], bcd[10:7], bcd[6:3], bcd[3:0]);
    end
  endtask

  initial begin
    // Test cases
    $display("Starting Binary to BCD test...");

    bin_d_in = 16'd0; #10;
    display_result(bin_d_in, bcd_d_out);

    bin_d_in = 16'd9; #10;
    display_result(bin_d_in, bcd_d_out);

    bin_d_in = 16'd45; #10;
    display_result(bin_d_in, bcd_d_out);

    bin_d_in = 16'd123; #10;
    display_result(bin_d_in, bcd_d_out);

    bin_d_in = 16'd999; #10;
    display_result(bin_d_in, bcd_d_out);

    bin_d_in = 16'd1234; #10;
    display_result(bin_d_in, bcd_d_out);

    bin_d_in = 16'd9999; #10;
    display_result(bin_d_in, bcd_d_out);

    bin_d_in = 16'd65535; #10;  // max 16-bit unsigned
    display_result(bin_d_in, bcd_d_out);
    
    bin_d_in = 16'd128; #10;  // max 16-bit unsigned
    display_result(bin_d_in, bcd_d_out);

    $display("Test complete.");
    $stop;
  end

endmodule
