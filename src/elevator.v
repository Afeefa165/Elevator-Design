`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2023 16:40:30
// Design Name: 
// Module Name: elevator
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


module elevator(
input clk, rst, ra,rb, rc, rd,
output wire [1:0] floor, 
output wire dir
    );
 parameter A=0, B=1, C=2, D=3;
 reg [1:0] state;
 parameter UP=0, DOWN=1;
 always@(posedge clk or posedge rst)
 begin 
 if(rst) state<=A;
 else begin 
   case(state)
A: case(1)
    ra: state<=A;
    rb: state<=B;
    rc: state<=C;
    rd: state<=D;
    endcase
B: case(dir)  
  UP:case(1)
    rb: state<=B;
    rc: state<=C;
    rd: state<=D;  
    ra: state<=A;
    endcase
    DOWN:case(1)
    rb: state<=B;
    rc: state<=C;
    rd: state<=D;  
    ra: state<=A;
    endcase
    endcase
C:case(dir) 
  UP:case(1)
    rc: state<=C;
    rd: state<=D;  
    ra: state<=A;
    rb: state<=B;
    endcase
  DOWN:case(1)
    rc: state<=C;
    rd: state<=D;  
    ra: state<=A;
    rb: state<=B;
    endcase  
    endcase
D: case(dir)
  UP:case(1)  
    rd: state<=D;  
    ra: state<=A;
    rb: state<=B;
    rc:state<=C;
    endcase
  DOWN:case(1)  
    rd: state<=D;  
    ra: state<=A;
    rb: state<=B;
    rc:state<=C;
    endcase
    endcase
endcase
end
end    
always@(posedge clk or posedge rst)
begin 
if(rst) state<=A;
else begin 
case(state)
A: case(1)
    ra: state<=UP;
    rb: state<=UP;
    rc: state<=UP;
    rd: state<=UP;
    endcase
B: case(dir)  
  UP:case(1)
    rb: state<=UP;
    rc: state<=UP;
    rd: state<=UP;  
    ra: state<=DOWN;
    endcase
    DOWN:case(1)
    rb: state<=UP;
    rc: state<=UP;
    rd: state<=UP;  
    ra: state<=DOWN;
    endcase
    endcase
C:case(dir) 
  UP:case(1)
    rc: state<=UP;
    rd: state<=UP;  
    ra: state<=DOWN;
    rb: state<=DOWN;
    endcase
  DOWN:case(1)
    rc: state<=UP;
    rd: state<=UP;  
    ra: state<=DOWN;
    rb: state<=DOWN;
    endcase  
    endcase
D: case(dir)
  UP:case(1)  
    rd: state<=UP;  
    ra: state<=DOWN;
    rb: state<=DOWN;
    rc:state<=DOWN;
    endcase
  DOWN:case(1)  
    rd: state<=UP;  
    ra: state<=DOWN;
    rb: state<=DOWN;
    rc:state<=DOWN;
    endcase
    endcase
endcase
end
end    
assign floor = state;
assign dir=(state==UP);
endmodule
