`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:02:27 06/13/2019
// Design Name:   TimeParameter
// Module Name:   C:/Users/Aruna/Documents/ISE/TrafficLightController/TimeParameter_test.v
// Project Name:  TrafficLightController
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TimeParameter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TimeParameter_test;

	// Inputs
	reg [1:0] Selector;
	reg [3:0] Time_value;
	reg Prog_Sync;
	reg [1:0] interval;
	reg clk;

	// Outputs
	wire [3:0] value;

	// Instantiate the Unit Under Test (UUT)
	TimeParameter uut (
		.Selector(Selector), 
		.Time_value(Time_value), 
		.Prog_Sync(Prog_Sync), 
		.interval(interval), 
		.clk(clk), 
		.value(value)
	);

	initial begin
		// Initialize Inputs
		Selector = 2'b00;
		Time_value = 4'b1111;
		Prog_Sync = 0;
		interval = 2'b00;
		
		// Wait 100 ns for global reset to finish
		#10;
       Selector = 2'b00; 
		 interval = 2'b01;
		// Add stimulus here
		#10;
		 Selector = 2'b01;
		 interval =2'b00;

	end
	
	initial begin
	clk = 0;
	forever begin
	 #5 clk = ~clk;
	end 
	end
      
endmodule

