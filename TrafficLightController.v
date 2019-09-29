`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:02 06/30/2019 
// Design Name: 
// Module Name:    TrafficLightController 
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
module TrafficLightController(
	input reset,
	input sensor,
	input walk_request,
	input reprogram,
	input [1:0] time_parameter_selector,
	input [3:0] time_value,
	input clock,
	output [6:0] led
   );
	
	wire [1:0] interval;
	wire [3:0] value;
	wire reset_sync, sensor_sync, wr_sync, wr, wr_reset, prog_sync, start_timer, expired, enable_1Hz;
	 
	FSM fsm_unit (
		.sensor_sync(sensor_sync), 
		.reset_sync(reset_sync), 
		.wr(wr), 
		.prog_sync(prog_sync), 
		.expired(expired), 
		.clock(clock),
		.wr_reset(wr_reset), 
		.interval(interval), 
		.start_timer(start_timer), 
		.led(led)
	);
	
	divider divider_unit (
		.clock(clock), 
		.reset_sync(reset_sync), 
		.enable_1Hz(enable_1Hz)
	);
	
	synchronizer synchronizer_unit (
		.clock(clock), 
		.reset(reset), 
		.sensor(sensor), 
		.walk_request(walk_request), 
		.reprogram(reprogram), 
		.reset_sync_global(reset_sync), 
		.sensor_sync(sensor_sync), 
		.wr_sync(wr_sync), 
		.prog_sync(prog_sync)
	);
	
	time_parameters time_parameters_unit (
		.clock(clock), 
		.time_parameter_selector(time_parameter_selector), 
		.time_value(time_value), 
		.interval(interval), 
		.prog_sync(prog_sync), 
		.value(value)
	);
	
	timer timer_unit (
		.enable_1Hz(enable_1Hz), 
		.clock(clock), 
		.value(value), 
		.start_timer(start_timer), 
		.reset_sync(reset_sync), 
		.expired(expired)
	);
	
	walk_register walk_register_unit (
		.wr_sync(wr_sync), 
		.wr_reset(wr_reset), 
		.wr(wr)
	);


endmodule
