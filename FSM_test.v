`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:57:31 06/11/2019
// Design Name:   FSM
// Module Name:   C:/Users/Aruna/Documents/ISE/TrafficLightController/FSM_test.v
// Project Name:  TrafficLightController
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_test;

	// Inputs
	
	reg Sensor_Sync;
	reg WR;
	reg expired;
	reg Prog_Sync;
	reg clk;
	reg Reset_Sync;

	// Outputs
	wire WR_Reset;
	wire [6:0] LEDs;
	wire [1:0] interval;
	wire start_timer;
	
	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.Sensor_Sync(Sensor_Sync), 
		.WR(WR), 
		.WR_Reset(WR_Reset), 
		.LEDs(LEDs), 
		.interval(interval), 
		.start_timer(start_timer), 
		.expired(expired), 
		.Prog_Sync(Prog_Sync), 
		.clk(clk),
		.Reset_Sync(Reset_Sync)
	);

	initial begin
		// Initialize Inputs
		
		// Normal operation
		Sensor_Sync = 0;
		WR = 0;
		expired = 0;
		Prog_Sync = 0;
		Reset_Sync = 0;
		#5
		Sensor_Sync = 0;
		Reset_Sync = 1;
		#5
		Reset_Sync = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5;
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5;
		expired = 0;
		
		
		
		// Test Walk request
		
		
		Sensor_Sync = 0;
		WR = 0;
		expired = 0;
		Prog_Sync = 0;
		Reset_Sync = 0;
		#5
		Sensor_Sync = 0;
		Reset_Sync = 1;
		WR = 1;
		#5
		Reset_Sync = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5;
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5;
		expired = 0; 
      
		// Test sensor input
		
		Sensor_Sync = 0;
		WR = 0;
		expired = 0;
		Prog_Sync = 0;
		Reset_Sync = 0;
		#5
		Sensor_Sync = 1;
		Reset_Sync = 1;
		//WR = 1;
		#5
		Reset_Sync = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5;
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
		#5
		expired = 1;
		#5;
		expired = 0;
		// Add stimulus here

	end
	
	initial begin 
	clk=0;
   forever begin
    #5 clk = ~clk;
	end 
	end
      
endmodule

