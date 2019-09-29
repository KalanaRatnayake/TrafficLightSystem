`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:39 06/29/2019 
// Design Name: 
// Module Name:    timer 
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
module timer(
	input enable_1Hz,
	input clock,
	input [3:0] value,
	input start_timer,
	input reset_sync,
	output reg expired
   );
	
	reg [3:0] counter;
	reg once = 0;
	
	always@(posedge clock, posedge reset_sync) begin
		if (reset_sync==1) counter <= value; 
		else begin
			if (!once) begin
				expired = 1;
				once = 1;
			end 
			else expired = 0;
			
			if(start_timer) begin
				counter <= value;
			end
			
			if (enable_1Hz) begin
				if (counter == 1) begin
					expired = 1;
				end 
				else begin
					counter <= counter - 1;
				end
			end
		end
	end
endmodule
