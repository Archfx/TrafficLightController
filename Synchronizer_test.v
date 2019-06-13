`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:53:54 06/13/2019
// Design Name:   Synchronizer
// Module Name:   C:/Users/Aruna/Documents/ISE/TrafficLightController/Synchronizer_test.v
// Project Name:  TrafficLightController
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Synchronizer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Synchronizer_test;

	// Inputs
	reg Reset;
	reg Sensor;
	reg Walk_Request;
	reg Reprogram;
	reg clk;

	// Outputs
	wire Prog_Sync;
	wire WR_Sync;
	wire Sensor_Sync;
	wire Reset_Sync;

	// Instantiate the Unit Under Test (UUT)
	Synchronizer uut (
		.Reset(Reset), 
		.Sensor(Sensor), 
		.Walk_Request(Walk_Request), 
		.Reprogram(Reprogram), 
		.clk(clk), 
		.Prog_Sync(Prog_Sync), 
		.WR_Sync(WR_Sync), 
		.Sensor_Sync(Sensor_Sync), 
		.Reset_Sync(Reset_Sync)
	);

	initial begin
		// Initialize Inputs
		Reset = 0;
		Sensor = 0;
		Walk_Request = 0;
		Reprogram = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
      Reset = 1;
		Sensor = 1;
		Walk_Request = 1;
		Reprogram = 1;  
		// Add stimulus here

	end
	
	initial begin
	clk = 0;
	forever begin
	 #5 clk = ~clk;
	end 
	end
      
endmodule

