`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:53 06/13/2019 
// Design Name: 
// Module Name:    TrafficControllerMain 
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
module TrafficControllerMain(
    input Reset,
    input Sensor,
    input Walk_Request,
    input Reprogram,
    input [1:0] Time_Parameter_Selector,
    input [3:0] Time_Value,
    input clk,
    output [6:0] LEDs
    );
	 
	Divider Divider (
		.rst(rst),
		.clk(clk), 
		.oneHz_enable(oneHz_enable)
	);
	
	FSM FSM (
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
	
	Synchronizer Synchronizer (
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


	TimeParameter TimeParameter (
			.Selector(Selector), 
			.Time_value(Time_value), 
			.Prog_Sync(Prog_Sync), 
			.interval(interval), 
			.clk(clk), 
			.value(value)
		);
		
	Timer Timer (
		.Value(Value), 
		.oneHz_enable(oneHz_enable), 
		.start_timer(start_timer),
		.clk(clk),
		.expired(expired),
		.Reset_Sync(Reset_Sync)
	);
	
	WalkRegister WalkRegister (
		.WR_Sync(WR_Sync), 
		.WR_Reset(WR_Reset),  
		.WR(WR)
	);



endmodule


