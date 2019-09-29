`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:32:07 06/30/2019
// Design Name:   TrafficLightController
// Module Name:   D:/Projects/TrafficLightSystem/TrafficLightController_test.v
// Project Name:  TrafficLightSystem
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TrafficLightController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TrafficLightController_test;

	// Inputs
	reg reset;
	reg sensor;
	reg walk_request;
	reg reprogram;
	reg [1:0] time_parameter_selector;
	reg [3:0] time_value;
	reg clock;

	// Outputs
	wire [6:0] led;

	// Instantiate the Unit Under Test (UUT)
	TrafficLightController uut (
		.reset(reset), 
		.sensor(sensor), 
		.walk_request(walk_request), 
		.reprogram(reprogram), 
		.time_parameter_selector(time_parameter_selector), 
		.time_value(time_value), 
		.clock(clock), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		sensor = 0;
		walk_request = 0;
		reprogram = 0;
		time_parameter_selector = 0;
		time_value = 0;
		clock = 0;

		#5;
		reset = 1;
		#5;
		reset = 0;
		
		//#100
		//walk request
		//Walk_Request = 1;
		
		//#20
		//Walk_Request = 0;
		
		
		// Vehicle sensor request
		//Sensor = 1;
	end
	
	initial forever #5 clock = ~clock;
      
endmodule

