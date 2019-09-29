`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:59 06/29/2019 
// Design Name: 
// Module Name:    divider 
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
module divider(
	input clock,
	input reset_sync,
	output reg enable_1Hz
   );
	
	reg [4:0] counter = 4'b1010;
	
	// assumes the outer clock works at 10hz rate. so counts 10 pulses before 
	// outputting a single enable_1hz pulse. this is done for simulation purposes
	// when deploying on a board of 100MHz, count needs to be 100,000,000.
	
	always@(posedge clock, posedge reset_sync) begin
		if (reset_sync==1) counter = 4'b1010;
		else begin
			enable_1Hz = 0;
			counter = counter - 1;
			if ( counter == 0)
				begin
					counter = 4'b1010;
					enable_1Hz= 1;
				end
		end
   end
endmodule
