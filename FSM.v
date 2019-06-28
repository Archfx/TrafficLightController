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
// LED sequence  : [Rm,Ym,Gm,Rs,Ys,Gs,Walk]
module FSM(
    input Sensor_Sync,
    input WR,
    output reg WR_Reset,
    output reg [6:0] LEDs,
    output reg [1:0] interval,
    output reg start_timer,
    input expired,
    input Prog_Sync,
	 input Reset_Sync,
	 input clk
    );
	 
	 localparam tb = 2'b00,//tBASE
					te = 2'b01,//tEXT
					ty = 2'b10,//tYEL
					tbx2 = 2'b11;//2*tBASE
					
	 reg deviate; // deviate from normal routine (WR and sensor_sync)
	 reg senseOneTime; // Trigger sensor_sync only one time during single cycle
	 
	 localparam A = 7'b0011000, //Main green
					B = 7'b0101000, //Main yellow
					C = 7'b1000010, //Side green
					D = 7'b1000100, //Side yellow
					E = 7'b1001001; //walk
	 
	 always@(posedge clk) 
		begin
		
		start_timer = 0;
		if (Prog_Sync | Reset_Sync) begin
			LEDs = A;
			interval = tbx2;
			WR_Reset = 0;
			start_timer = 1;
			senseOneTime = 1;
			end
		if (expired) 
			begin
				case (LEDs)
					A: begin
							if (deviate) begin
								if (Sensor_Sync & senseOneTime)begin
									LEDs = A;
									interval = te;
									start_timer = 1;
									senseOneTime = 0;
 								end
								else begin
									LEDs = A;
									interval = tb;
									start_timer = 1;
								end
								deviate = 0;
							end
							
							else begin	
								LEDs = B;
								interval = ty;
								start_timer = 1;
							end
						end
					
					B:	begin
							if (WR) begin
								LEDs = E;
								interval = te;
								start_timer = 1;
								WR_Reset = 1;
							end
							else begin
								LEDs = C;
								interval = tb;
								start_timer = 1;
							end
							senseOneTime = 1;
						end
					C: begin
							if (Sensor_Sync & senseOneTime) begin
								LEDs = C;
								interval = te;
								start_timer = 1;
								senseOneTime = 0;
							end
							else begin
								LEDs = D;
								interval = ty;
								start_timer = 1;
								senseOneTime = 1;
							end
						end
					D: begin
							LEDs = A;
							interval = tb;
							start_timer = 1;
							deviate = 1;
							senseOneTime = 1;
						end
					E: begin
							LEDs = C;
							interval = ty;
							start_timer = 1;
							WR_Reset = 0;
						end
					default : 
							begin
							LEDs = A;
							interval = tb;
							start_timer = 1;
							end
				endcase
		
		end
		end
	
	

endmodule
