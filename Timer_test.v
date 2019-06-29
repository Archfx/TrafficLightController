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
	reg clk;
	reg Reset_Sync;

	// Outputs
	wire expired;

	// Instantiate the Unit Under Test (UUT)
	Timer uut (
		.Value(Value), 
		.oneHz_enable(oneHz_enable), 
		.start_timer(start_timer),
		.clk(clk),
		.expired(expired),
		.Reset_Sync(Reset_Sync)
	);

	initial begin
		// Initialize Inputs
		Value = 0;
		oneHz_enable = 0;
		start_timer = 0;
		Reset_Sync = 0;
		// Wait 100 ns for global reset to finish
		#5;
      Value=4'b1100;
		start_timer=1;
		Reset_Sync = 1;
		#5;
		start_timer=0;
		Reset_Sync = 0;
		#30;
		//Value=4'b1000;
		

	end
	
		initial begin 
			oneHz_enable=0;
			forever begin
				#5 oneHz_enable = ~oneHz_enable;
					  end 
					end
      initial begin 
			clk=0;
			forever begin
				#5 clk = ~clk;
					  end 
					end
endmodule

