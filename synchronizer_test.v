`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:07:43 06/30/2019
// Design Name:   synchronizer
// Module Name:   D:/Projects/TrafficLightSystem/synchronizer_test.v
// Project Name:  TrafficLightSystem
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: synchronizer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module synchronizer_test;

	// Inputs
	reg clock;
	reg reset;
	reg sensor;
	reg walk_request;
	reg reprogram;

	// Outputs
	wire reset_sync_global;
	wire sensor_sync;
	wire wr_sync;
	wire prog_sync;

	// Instantiate the Unit Under Test (UUT)
	synchronizer uut (
		.clock(clock), 
		.reset(reset), 
		.sensor(sensor), 
		.walk_request(walk_request), 
		.reprogram(reprogram), 
		.reset_sync_global(reset_sync_global), 
		.sensor_sync(sensor_sync), 
		.wr_sync(wr_sync), 
		.prog_sync(prog_sync)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		sensor = 0;
		walk_request = 0;
		reprogram = 0;

		#5;
        
		reset = 1;
		
		#7;
		
		sensor = 1;
		
		#9;
		
		walk_request = 1;
		
		#6;
		
		reprogram = 1;
		
		#5;
	end
	
	initial forever #5 clock = ~clock;

endmodule

