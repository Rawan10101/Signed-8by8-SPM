`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2025 05:19:37 AM
// Design Name: 
// Module Name: testingCarrySaveAdder
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


module testingCarrySaveAdder();
reg clk; 
reg x; 
reg y; 
reg rst;
wire sum; 

// Dumpfile for GTKWave
  initial begin
    $dumpfile("testingCarrySaveAdder.vcd");
    $dumpvars(0, testingCarrySaveAdder);
  end

  // Display outputs to the terminal
  initial begin
    $monitor("Time=%0t | rst= %d x=%d y=%d | sum=%d", 
              $time, rst, x, y, sum);
  end

initial begin
 clk<=0;
forever begin
    #10
    clk <= ~clk;
 end
 
 end
 
 
initial begin
rst <= 1;
#5
rst <= 0;
end 

initial begin
    {x,y} = 2'b00;
    #20
    {x,y} = 2'b01;
    #20
    {x,y} = 2'b10;
    #20
    {x,y} = 2'b11;
end
 
carrySave DUT (clk,rst,x,y,sum);
initial begin 
    #100
	$display( "Testing is complete.");
    $finish;
end
endmodule
