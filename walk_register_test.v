`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:52:36 06/30/2019
// Design Name:   walk_register
// Module Name:   D:/Projects/TrafficLightSystem/walk_register_test.v
// Project Name:  TrafficLightSystem
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: walk_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module walk_register_test;

	// Inputs
	reg wr_sync;
	reg wr_reset;

	// Outputs
	wire wr;

	// Instantiate the Unit Under Test (UUT)
	walk_register uut (
		.wr_sync(wr_sync), 
		.wr_reset(wr_reset), 
		.wr(wr)
	);

	initial begin
		// Initialize Inputs
		wr_sync = 0;
		wr_reset = 0;

		#5; 
		
		wr_sync = 1;
		
		#5;
		
		wr_sync = 0;
		
		#60;
		
		wr_reset = 1;

	end
      
endmodule

