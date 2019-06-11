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
    output [6:0] LEDs,
    output [2:0] interval,
    output start_timer,
    input expired,
    input Prog_Sync
    );
	 
	 localparam A=7'b0011000, //Main green
					B=7'b0101000, //Main yellow
					C=7'b1000010, //Side green
					D=7'b1000100, //Side yellow
					E=7'b1001001; //walk
	 


endmodule
