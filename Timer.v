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
	 
	 //reg run_timer = 0;
	 reg [3:0] time_left;
	
	 /*always@(posedge start_timer) begin
												run_timer = 1;
												time_left=Value;
											end
	 
	 always@(posedge oneHz_enable & run_timer) 
		begin
			if (!time_left) begin
									expired = 1;
									run_timer = 0;
								end
			else begin
					time_left = time_left - 1;
					expired = 0;
					end
			if (oneHz_enable) rst = 1;
		end
		*/
		
	always@(posedge clk) begin
			expired = 0;			
			if (Reset_Sync) begin
				expired = 0;
				time_left = 0;
			end
			
			if (start_timer) begin
				time_left=Value;
			end	
			
	end
	
	always@(posedge oneHz_enable) begin
			expired = (time_left == 4'd1);
			time_left = time_left - 1;
			
			if (!time_left) time_left=Value;
	end
	
		


endmodule
