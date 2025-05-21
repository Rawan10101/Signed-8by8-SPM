`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2025 11:34:33 AM
// Design Name: 
// Module Name: FSM
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
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2025 11:34:33 AM
// Design Name: 
// Module Name: FSM
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

module FSM(
    input clk_out_i, 
    input rst_i, 
    input startOperation_i, 
    input [7:0] x_i, 
    input [7:0] y_i, 
    output reg [15:0] out_o, 
    output done_o
);

// Registers
reg [15:0] Y_r;
reg [4:0] count_r;
reg [1:0] currentState_r, nextState_r;

// Local parameters for FSM states
localparam [1:0] START = 2'b00;
localparam [1:0] RUNNING = 2'b01;
localparam [1:0] DONE = 2'b10;

// State transition
always @ (posedge clk_out_i or posedge rst_i) begin
    if (rst_i)
        currentState_r <= START;
    else 
        currentState_r <= nextState_r;
end

// Next state logic
always @* begin
    case (currentState_r)
        START: begin
            if (startOperation_i)
                nextState_r <= RUNNING;
            else
                nextState_r <= START;
        end
        RUNNING: begin
            if (count_r == 5'd16)
                nextState_r <= DONE;
            else
                nextState_r <= RUNNING;
        end
        DONE: 
            nextState_r <= DONE;

        default: 
            nextState_r <= START;
    endcase
end

// Counter logic
always @(posedge clk_out_i or posedge rst_i) begin
    if (rst_i)
        count_r <= 5'd0;
    else if (currentState_r == START && startOperation_i)
        count_r <= 5'd0;
    else if (currentState_r == RUNNING)
        count_r <= count_r + 1;
end

// Main datapath logic
always @ (posedge clk_out_i or posedge rst_i) begin
    if (rst_i) begin
        Y_r <= 16'd0;
        out_o <= 16'd0;
    end
    else if (startOperation_i) begin
        out_o <= 16'd0;
        Y_r <= {{8{y_i[7]}}, y_i};  // Sign-extend y_i into Y_r
    end
    else if (currentState_r == RUNNING) begin
        out_o <= {product_w, out_o[15:1]};
        Y_r <= (Y_r >> 1);
    end
end

// Intermediate wire for LSB of Y
wire ywire_w = (currentState_r == RUNNING) ? Y_r[0] : 1'b0;

// Wire for multiplier output
wire product_w;

// Instantiating multiplier
multiplier mult (
    .clk_i(clk_out_i), 
    .rst_i(rst_i), 
    .x_i(x_i), 
    .y_i(ywire_w), 
    .product_o(product_w)
);

// Done signal
assign done_o = (currentState_r == DONE) ? 1'b1 : 1'b0;

endmodule
