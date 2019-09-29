`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:26:30 06/29/2019 
// Design Name: 
// Module Name:    time_parameters 
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
module time_parameters(
	input clock,
	input [1:0] time_parameter_selector,
	input [3:0] time_value,
	input [1:0] interval,
	input prog_sync,
	output reg [3:0] value
   );
	
	reg[3:0] t_base = 4'b0110, t_ext = 4'b0011, t_yel = 4'b0010;
	
	always@(posedge clock) begin
	
	case(interval)
		2'b00: value = t_base;
		2'b01: value = t_ext;
		2'b10: value = t_yel;
	endcase
	
	if (prog_sync) begin
		case (time_parameter_selector) 
			2'b00: t_base = time_value;
			2'b01: t_ext = time_value;
			2'b10: t_yel = time_value;
		endcase
	end		
	end
endmodule
