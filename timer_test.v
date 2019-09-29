`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:32:08 06/30/2019
// Design Name:   timer
// Module Name:   D:/Projects/TrafficLightSystem/timer_test.v
// Project Name:  TrafficLightSystem
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: timer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module timer_test;

	// Inputs
	reg enable_1Hz;
	reg clock;
	reg [3:0] value;
	reg start_timer;
	reg reset_sync;

	// Outputs
	wire expired;

	// Instantiate the Unit Under Test (UUT)
	timer uut (
		.enable_1Hz(enable_1Hz), 
		.clock(clock), 
		.value(value), 
		.start_timer(start_timer), 
		.reset_sync(reset_sync), 
		.expired(expired)
	);

	initial begin
		enable_1Hz = 0;
		clock = 0;
		value = 0;
		start_timer = 0;
		reset_sync = 0;

		#5;
        
		value= 4'b0110;
		start_timer = 1;
		
		#5;
		
		start_timer = 0;
		
		#95;
		
		reset_sync = 1;
		
		#5;
		
		reset_sync = 0;
		
		#295;
		
		value= 4'b0010;
		start_timer = 1;
		
		#5;
		
		start_timer = 0;
		
	end
		
	initial begin 
		forever begin
			#45 enable_1Hz = ~enable_1Hz;
			#5  enable_1Hz = ~enable_1Hz;
		end
	end
		
   initial begin 
		forever #5 clock = ~clock;
	end
      
endmodule

