`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:45 06/30/2019 
// Design Name: 
// Module Name:    FSM 
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
module FSM(
	input sensor_sync,
	input reset_sync,
	input wr,
	input prog_sync,
	input expired,
	input clock,
	output reg wr_reset,
	output reg [1:0] interval,
	output reg start_timer,
	output reg [6:0] led
   );
	
	reg [2:0] present_state, next_state;
	parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

	always@(posedge clock) begin
		if (prog_sync==1) present_state <= S0;
		else if (reset_sync==1) present_state <= S0;
		else if (expired == 1) begin
			present_state <= next_state;
			start_timer = 1;
			end
		else start_timer = 0;
	end
	
	always@(present_state, sensor_sync, wr) begin
		case(present_state)
			S0: if (sensor_sync==1) next_state <= S1; else next_state <= S2;
			S1: next_state <= S3;
			S2: next_state <= S3;
			S3: if (wr==1) next_state <= S4; else next_state <= S5;
			S4: next_state <= S5;
			S5: if (sensor_sync==1) next_state <= S6; else next_state <= S7;
			S6: next_state <= S7;
			S7: next_state <= S0;
		endcase
	end

	always@(present_state) begin
		case(present_state)
		
			S0: begin
					led = 7'b0011000;  //main - green, side - red
					interval = 2'b00;  //t_base
					wr_reset = 0;
				 end
				 
			S1: begin
					led = 7'b0011000;  //main - green, side - red
					interval = 2'b01;  //t_ext
					wr_reset = 0;
				 end
				 
			S2: begin
					led = 7'b0011000;  //main - green, side - red
					interval = 2'b00;  //t_base
					wr_reset = 0;
				 end
				 
			S3: begin
					led = 7'b0101000;  //main - yellow, side - red
					interval = 2'b10;  //t_yel
					wr_reset = 0;
				 end
				 
			S4: begin
					led = 7'b1001001;  //main - red, side - red, walk - on
					interval = 2'b01;  //t_ext
					wr_reset = 1;
				 end
				 
			S5: begin
					led = 7'b1000010;  //main - red, side - green
					interval = 2'b00;  //t_base
					wr_reset = 0;
				 end
				 
			S6: begin
					led = 7'b1000010;  //main - red, side - green
					interval = 2'b01;  //t_ext
					wr_reset = 0;
				 end
				 
			S7: begin
					led = 7'b1000100;  //main - red, side - yellow
					interval = 2'b10;  //t_yel
					wr_reset = 0;
				 end
		endcase
	end
endmodule
