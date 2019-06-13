`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:26:32 06/12/2019 
// Design Name: 
// Module Name:    Divider 
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
module Divider(
    input clk,
	 input rst,
    output reg oneHz_enable
    );
	 reg [24:0]counter = 25'b00100011;
	 always@(posedge clk)
		begin
			counter = counter - 1;
			if (!counter) oneHz_enable = 1;
		end
	 always@(posedge rst)
		begin
			counter = 25'b00100011;
			oneHz_enable = 0;
		end


endmodule
