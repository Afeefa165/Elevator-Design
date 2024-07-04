`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2023 22:16:28
// Design Name: 
// Module Name: elevator_tb
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


//module elevator_tb();
//reg clk,rst,inG,in1,in2,in3,in4,in5,in6,in7,inopen,inclose;
//wire open,close,up,down;
//parameter period=10;
//reg[7:0]ins;
//elevator DUT(clk,rst,inG,in1,in2,in3,in4,in5,in6,in7,inopen,inclose,open,close,up,down);
//initial begin
//clk=1'b1;
//inG=0;
//in1=0;
//in2=0;
//in3=0;
//in4=0;
//in5=0;
//in6=0;
//in7=0;
//inopen=0;
//inclose=0;
//end
//always #(period/2)clk=~clk;
//initial begin
//rst=1'b1;
//#period rst=~rst;
//#period rst=~rst;
//end
//initial begin
//#30 ins=$random;
//$display("inputs:%b,ins random:%b",{inG,in1,in2,in3,in4,in5,in6,in7},ins);
//{inG,in1,in2,in3,in4,in5,in6,in7}=ins;
//repeat(3)
//intest;
//wait(!{inG,in1,in2,in3,in4,in5,in6,in7})
//#100 $finish;
//end
//always@(posedge DUT.open)begin
//case(DUT.nfloor)
//DUT.G:inG=0;
//DUT.F1:in1=0;
//DUT.F2:in2=0;
//DUT.F3:in3=0;
//DUT.F4:in4=0;
//DUT.F5:in5=0;
//DUT.F6:in6=0;
//DUT.F7:in7=0;
//endcase
//end
//initial begin
//$monitor("pfloor:%d,inputs:%b,ins random:%b",DUT.pfloor,{inG,in1,in2,in3,in4,in5,in6,in7},ins);
////$recordfile("./elevator.trn");
////$recordvars("depth=0");
//end
//task intest;begin
//#10;
//#10;
////wait(open)
////wait(close)
//ins=$random;
//ins=(ins|{inG,in1,in2,in3,in4,in5,in6,in7});
//{inG,in1,in2,in3,in4,in5,in6,in7}=ins;
//$display("ins after:%b",ins);
//end endtask
//endmodule





`timescale 1ns / 1ps

module elevator_tb;

  // Parameters
  parameter TIME_PERIOD = 10; // Time period for clock in simulation
  parameter SIM_TIME = 1000;  // Simulation time in time units

  // Signals
  reg clk;
  reg rst;
  reg inG, in1, in2, in3, in4, inopen, inclose;
  wire open, close, up, down;

  // Instantiate the elevator module
  elevator1 uut (
    .clk(clk),
    .rst(rst),
    .inG(inG),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .inopen(inopen),
    .inclose(inclose),
    .open(open),
    .close(close),
    .up(up),
    .down(down)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #((TIME_PERIOD / 2)) clk = ~clk;
  end

  // Initial stimulus
  initial begin
    // Initialize signals
    rst = 1;
    inG = 0; in1 = 0; in2 = 0; in3 = 0; in4 = 0; in5 = 0; in6 = 0; in7 = 0;
    inopen = 0; inclose = 0;

    // Apply reset
    #20 rst = 0;

    // Elevator moving up
    #10 in3 = 1;
    #10 inopen = 1;
    #10 inopen = 0;

    // Elevator open at floor 3
    #10 inclose = 1;
    #10 inclose = 0;

    // Elevator idle
    #10 inG = 1;
    #10 inopen = 1;
    #10 inopen = 0;

    // Elevator moving down
    #10 in4 = 1;
    #10 inopen = 1;
    #10 inopen = 0;

    // Elevator open at floor 4
    #10 inclose = 1;
    #10 inclose = 0;

    // Elevator idle
    #10 inG = 1;
    #10 inopen = 1;
    #10 inopen = 0;

    // End simulation
    #10 $finish;
  end

endmodule




















//module elevator_tb;

//  reg clk, rst, inG, in1, in2, in3, in4, in5, in6, in7, inopen, inclose;
//  wire open, close, up, down;

//  // Instantiate the elevator module
//  elevator dut (
//    .clk(clk),
//    .rst(rst),
//    .inG(inG),
//    .in1(in1),
//    .in2(in2),
//    .in3(in3),
//    .in4(in4),
//    .in5(in5),
//    .in6(in6),
//    .in7(in7),
//    .inopen(inopen),
//    .inclose(inclose),
//    .open(open),
//    .close(close),
//    .up(up),
//    .down(down)
//  );

//  // Clock generation
//  always #5 clk = ~clk;

//  // Initialize inputs
//  initial begin
//    clk = 0;
//    rst = 1;
//    inG = 0;
//    in1 = 0;
//    in2 = 0;
//    in3 = 0;
//    in4 = 0;
//    in5 = 0;
//    in6 = 0;
//    in7 = 0;
//    inclose=0;
//    inopen=0;

//    // De-assert reset
//    #10 rst = 0;

//    // Scenario 1: Open the door when idle at G floor
//    #20 inopen = 1;

//    // Scenario 2: Close the door
//    #20 inopen = 0;
//    #20 inclose = 1;

//    // Scenario 3: Move to floor F4
//    #20 in4 = 1;
//    #20 inopen = 1;inclose=0;
    

//    // Scenario 4: Move to floor F7
//    #20 in4 = 0;
//    #20 in7 = 1;
//    #20 inopen = 1;inclose=0;
//    #20 inclose=1;inopen=0;

//    // Add more test scenarios here...

//    // Finish simulation
//    #100 $finish;
//  end

//endmodule








































































