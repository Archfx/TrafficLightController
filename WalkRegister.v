`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:48 06/13/2019 
// Design Name: 
// Module Name:    WalkRegister 
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
module WalkRegister(
    input WR_Sync,
    input WR_Reset,
    output reg WR
    );
	 
	 always@(posedge WR_Sync ,posedge WR_Reset) begin
		if (WR_Sync) WR = 1;
		if (WR_Reset) WR = 0;
	 end
	
	 


endmodule
