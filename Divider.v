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
	 
	 localparam [24:0] hz_constant = 25'd10;
	 reg [24:0]counter = hz_constant;
	 always@(posedge clk)
		begin
			if (rst) counter = hz_constant;
			else begin
				counter = counter - 1;
				oneHz_enable = (counter == 0);
				if (!counter) counter = hz_constant;
			end
		end


endmodule
