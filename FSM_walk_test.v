`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:28:41 06/30/2019
// Design Name:   FSM
// Module Name:   D:/Projects/TrafficLightSystem/FSM_walk_test.v
// Project Name:  TrafficLightSystem
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

module FSM_walk_test;

	// Inputs
	reg sensor_sync;
	reg reset_sync;
	reg wr;
	reg prog_sync;
	reg expired;
	reg clock;

	// Outputs
	wire wr_reset;
	wire [1:0] interval;
	wire start_timer;
	wire [6:0] led;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
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

	initial begin
		sensor_sync = 0;
		clock = 0;
		wr = 0;
		expired = 0;
		prog_sync = 0;
		reset_sync = 0;
		#5
		sensor_sync = 0;
		reset_sync = 1;
		wr = 1;
		#5
		reset_sync = 0;
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
		#5
		expired = 0;
		#5
		expired = 1;
		#5
		expired = 0;
	end
	
	initial forever #5 clock = ~clock;
      
endmodule

