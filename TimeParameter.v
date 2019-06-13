`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:23 06/13/2019 
// Design Name: 
// Module Name:    TimeParameter 
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
module TimeParameter(
    input [1:0] Selector,
    input [3:0] Time_value,
    input Prog_Sync,
	 input [1:0] interval,
	 input clk,
    output reg [3:0] value
    );
	 
	 reg[3:0] tb = 4'b0110, // interval value = 00
				 te = 4'b0011, // interval value = 01
				 ty = 4'b0010; // interval value = 10
	     
						 
	always@(posedge clk) begin
	
	case (interval)
		
		2'b00: value = tb;
		2'b01: value = te;
		2'b10: value = ty;
		2'b11: value = 2*tb;
	
	endcase
	// Times resets when the selector input is 00. Otherwise the values 
	// on the time_value input are assigned to the tb, te, ty respectively.
	// Since register stores the values selected values will be saved untill selector becomes 00.
	
	case (Selector) 
		2'b00: begin
					tb = 4'b0110; // interval value = 00
				   te = 4'b0011; // interval value = 01
				   ty = 4'b0010; // interval value = 10
				 end
		2'b01: tb = Time_value;
		2'b10: te = Time_value;
		2'b11: ty = Time_value;
	endcase
		
	end

	

endmodule
