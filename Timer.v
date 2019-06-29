`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:06 06/12/2019 
// Design Name: 
// Module Name:    Timer 
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
module Timer(
    input [3:0] Value,
    input oneHz_enable,
    input start_timer,
	 input clk,
	 input Reset_Sync,
    output reg expired
    );
	 
	 
	 reg [3:0] time_left;
	 reg change =1; // Since Value is set by the time parameter module Value should be assinged to time_left after a one clock cycle 
	 
	always@(posedge clk) begin
		
		if (!change) begin
			change = 1;
			time_left = Value-1;
		end
			
		if (Reset_Sync)begin
			change = 0;
		end			
		if (start_timer) begin
			change =0;
		end
		expired = 0;
		
		if (oneHz_enable) begin
			if (!time_left) begin
				expired = 1;
				end
	
			else begin
			time_left = time_left - 1;
			end
		end
				
																		
	end



endmodule
