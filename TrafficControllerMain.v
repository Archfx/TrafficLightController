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
    output [6:0] LEDs,
	 output start_timer,  //for visual purposes only
	 output Reset_Sync,	 //for visual purposes only
	 output expired,      //for visual purposes only
	 output oneHz_enable, //for visual purposes only
	 output [3:0] value,  //for visual purposes only
	 output [1:0] interval//for visual purposes only
    );
	 
	 wire [1:0] interval;
	 wire [1:0] Selector;
	 wire [3:0] value;
	 wire Reset_Sync,oneHz_enable,Sensor_Sync,WR,WR_Reset,start_timer,expired,Prog_Sync,
			WR_Sync;
	 
	Divider divider (
		.rst(Reset_Sync),
		.clk(clk), 
		.oneHz_enable(oneHz_enable)
	);
	
	FSM fsm (
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
	
	Synchronizer synchronizer (
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


	TimeParameter timeParameter (
			.Selector(Time_Parameter_Selector), 
			.Time_value(Time_Value), 
			.Prog_Sync(Prog_Sync), 
			.interval(interval), 
			.clk(clk), 
			.value(value)
		);
		
	Timer timer (
		.Value(value), 
		.oneHz_enable(oneHz_enable), 
		.start_timer(start_timer),
		.clk(clk),
		.expired(expired),
		.Reset_Sync(Reset_Sync)
	);
	
	WalkRegister walkRegister (
		.WR_Sync(WR_Sync), 
		.WR_Reset(WR_Reset),  
		.WR(WR)
	);



endmodule


