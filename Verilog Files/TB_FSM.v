module TB_FSM();

reg clk, rst, startOperation;
reg [7:0] x, y;
wire [15:0] out;
wire done;

initial begin
    clk = 0;
    forever begin
    #10
    clk = ~clk;
    end

end

initial begin
startOperation = 1'b1;
#20 
startOperation =1'b0;
end

initial begin
rst=1;
#10 
rst=0;

        x = 8'd25;
        y = 8'd15;
        
//#10 
//x = 8'd100;
//y = -8'd2;
//#10 
//x = -8'd1;
//y = 8'd10000;
//#10 
//x = -8'd64;
//y = -8'd2;
end
FSM DUT(clk, rst, startOperation, x, y, out, done);

endmodule