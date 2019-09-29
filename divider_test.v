`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:17:13 06/30/2019
// Design Name:   divider
// Module Name:   D:/Projects/TrafficLightSystem/divider_test.v
// Project Name:  TrafficLightSystem
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module divider_test;

	// Inputs
	reg clock;
	reg reset_sync;

	// Outputs
	wire enable_1Hz;

	// Instantiate the Unit Under Test (UUT)
	divider uut (
		.clock(clock), 
		.reset_sync(reset_sync), 
		.enable_1Hz(enable_1Hz)
	);


	initial begin 
		clock = 0;
		reset_sync = 0;
		#135;
		reset_sync = 1;
		#5;
		
		reset_sync=0;
	end
	
	initial forever #5 clock = ~clock;
      
endmodule

