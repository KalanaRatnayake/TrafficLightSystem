`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:48:11 06/28/2019 
// Design Name: 
// Module Name:    synchronizer 
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
module synchronizer(
	input clock,
	input reset,
	input sensor,
	input walk_request,
	input reprogram,
	output reg reset_sync_global,
	output reg sensor_sync,
	output reg wr_sync,
	output reg prog_sync
	);
	
	always@(posedge clock) begin
	
	if (reset == 1) reset_sync_global = 1; else reset_sync_global = 0;
	if (sensor == 1) sensor_sync = 1; else sensor_sync = 0;
	if (walk_request == 1) wr_sync = 1; else wr_sync = 0;
	if (reprogram == 1) prog_sync = 1; else prog_sync = 0;
	
	end
endmodule
