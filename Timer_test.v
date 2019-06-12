`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:12:16 06/12/2019
// Design Name:   Timer
// Module Name:   C:/Users/Aruna/Documents/ISE/TrafficLightController/Timer_test.v
// Project Name:  TrafficLightController
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Timer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Timer_test;

	// Inputs
	reg [3:0] Value;
	reg oneHz_enable;
	reg start_timer;

	// Outputs
	wire expired;

	// Instantiate the Unit Under Test (UUT)
	Timer uut (
		.Value(Value), 
		.oneHz_enable(oneHz_enable), 
		.start_timer(start_timer), 
		.expired(expired)
	);

	initial begin
		// Initialize Inputs
		Value = 0;
		oneHz_enable = 0;
		start_timer = 0;

		// Wait 100 ns for global reset to finish
		#100;
      Value=4'b0100;
		start_timer=1;
		#100;
		start_timer=0;
		// Add stimulus here

	end
	
		initial begin 
			oneHz_enable=0;
			forever begin
				#60 oneHz_enable = ~oneHz_enable;
					  end 
					end
      
endmodule

