`timescale 1ns / 1ps

module elevator_tb;

reg clk;
reg rst;
reg inG, in1, in2,in3, in4, in5, in6, in7, inopen, inclose;
wire open, close, up, down;
wire [2:0]y;

elevator dut(clk, rst, inG, in1, in2,in3, in4, in5, in6, in7, inopen, inclose, open, close, up, down, y);

initial begin
clk = 0;
rst = 1;
#5 rst = 0;
end

always begin
#5 clk = ~clk;
end

initial begin
inG = 0;
in1 = 0;
in2 = 0;
in3 = 0;
in4 = 0;
in5 = 0;
in6 = 0;
in7 = 0;
inopen = 0;
inclose = 0;

#50 inG = 1;
#50 inG = 0;
#50 in1 = 1;
#50 in1 = 0;
#50 in7 = 1;
#50 in7 = 0;
#50 inopen = 1;
#50 inopen = 0;

#50 inclose = 1;
#50 inclose = 0;
#50 in2 = 1;
#50 in2 = 0;
#50 in3 = 1;
#50 in3 = 0;
#50 inopen = 1;
#50 inopen=0;
#100 $finish;
end
endmodule






