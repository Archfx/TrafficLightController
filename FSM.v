`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:44 06/11/2019 
// Design Name: 
// Module Name:    FSM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
// LED sequance : [Rm,Ym,Gm,Rs,Ys,Gs,Walk]
module FSM(
    input Sensor_Sync,
    input WR,
    output WR_Reset,
    output reg [6:0] LEDs,
    output [2:0] interval,
    output start_timer,
    input expired,
    input Prog_Sync,
	 input clk
    );
	 
	 localparam tb = 4'b0110,
					te = 4'b0011,
					ty = 4'b0010;
	 reg [3:0] t = 2*tb;			
	 //reg [6:0] state;
					
	 localparam A = 7'b0011000, //Main green
					B = 7'b0101000, //Main yellow
					C = 7'b1000010, //Side green
					D = 7'b1000100, //Side yellow
					E = 7'b1001001; //walk
	 
	 always@(posedge clk) 
		begin
		if (t)
			t=t-1;
		else 
		begin
		case (LEDs)
			A: begin
					LEDs = B;
					t=ty;
				end
			
			B:	begin
					LEDs = C;
					t=tb;
				end
			C: begin
					LEDs = D;
					t=ty;
				end
			D: begin
					LEDs = A;
					t=2*tb;
				end
			E: begin
					LEDs = C;
					t=ty;
				end
			default : 
					begin
					LEDs = A;
					t=2*tb;
					end
		endcase
		
		if (LEDs == B & WR) 
								begin
									LEDs = E;
									t=te;
								end
		
		end
		
		end
	
	

endmodule
