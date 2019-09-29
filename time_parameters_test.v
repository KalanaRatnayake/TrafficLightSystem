`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:22:43 06/30/2019
// Design Name:   time_parameters
// Module Name:   D:/Projects/TrafficLightSystem/time_parameters_test.v
// Project Name:  TrafficLightSystem
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: time_parameters
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module time_parameters_test;

	// Inputs
	reg clock;
	reg [1:0] time_parameter_selector;
	reg [3:0] time_value;
	reg [1:0] interval;
	reg prog_sync;

	// Outputs
	wire [3:0] value;

	// Instantiate the Unit Under Test (UUT)
	time_parameters uut (
		.clock(clock), 
		.time_parameter_selector(time_parameter_selector), 
		.time_value(time_value), 
		.interval(interval), 
		.prog_sync(prog_sync), 
		.value(value)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		time_parameter_selector = 2'b00;
		time_value = 4'b0000;
		interval = 2'b00;
		prog_sync = 0;
		
		#5;
		
		interval = 2'b10;

		#10;
		
		interval = 2'b01;

		#10;
		
		interval = 2'b00;

		#10;
		
		time_parameter_selector = 2'b10;
		time_value = 4'b1111;
		prog_sync = 1;
		interval = 2'b01;
		
		#10;
		
		interval = 2'b10;
		
		#10;
		
	end
	
	initial forever #5 clock = ~clock;
      
endmodule

