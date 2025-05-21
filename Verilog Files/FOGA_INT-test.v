`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 01:37:27 PM
// Design Name: 
// Module Name: FOGA_INT-test
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


`timescale 1ns / 1ps

module tb_FPGA_INT;

    // Inputs
    reg clk;
    reg reset;
    reg btnl;
    reg btnr;
    reg startOperation;
    reg [7:0] x;
    reg [7:0] y;

    // Outputs
    wire done;
    wire [6:0] LED_out;
    wire [3:0] finanode;

    // Instantiate the Unit Under Test (UUT)
    FPGA_INT uut (
        .clkk(clk), 
        .reset(reset), 
        .btnl(btnl), 
        .btnr(btnr), 
        .startOperation(startOperation), 
        .x(x), 
        .y(y), 
        .done(done), 
        .LED_out(LED_out), 
        .finanode(finanode)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        btnl = 0;
        btnr = 0;
        startOperation = 0;
        x = 8'd0;
        y = 8'd0;

        // Wait for reset
        #20;
        reset = 0;

        // Set inputs for multiplication test
        x = 8'd6;
        y = 8'd3;

        // Start the operation
        #10 startOperation = 1;
        #10 startOperation = 0;

        // Wait for operation to complete
        wait(done == 1);

        $display("Multiplication done. Output ready.");
        $display("LED_out: %b", LED_out);
        $display("finanode: %b", finanode);

        // Simulate button presses to test state transitions
        #20 btnr = 1;
        #10 btnr = 0;

        #20 btnr = 1;
        #10 btnr = 0;

        #20 btnl = 1;
        #10 btnl = 0;

        #100;

        $finish;
    end

endmodule
