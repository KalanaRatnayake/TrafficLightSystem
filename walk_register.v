`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:26:11 06/28/2019 
// Design Name: 
// Module Name:    walk_register 
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
module walk_register(
	input wr_sync,
	input wr_reset,
	output reg wr
	);
	
	always@(posedge wr_sync, posedge wr_reset) begin
		if(wr_sync) wr = 1;
		if(wr_reset) wr = 0;
	end
endmodule
