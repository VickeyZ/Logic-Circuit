`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:42:15 01/05/2020 
// Design Name: 
// Module Name:    bounce 
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
module bounce(
	input wire clk,
	input wire start,
	input wire reset,
	input wire [3:0] max_speed,
	output reg [9:0] x,
	output reg [8:0] y,
	output reg [3:0] speed,
	output reg direction
    );
	
	initial begin
		x <= 10'd276;
		y <= 9'd320;
		speed <= 7;
		direction <= 1;
	end
	
	always @(posedge clk or negedge reset) begin
		if(reset == 0)begin
			if(start == 0)begin
				x <= 10'd276;
				y <= 9'd320;
				speed <= 7;
				direction <= 1;
			end
		end
		else begin
			if(start == 1) begin
				if(direction == 1)
					y <= y - speed;
				else
					y <= y + speed;
				if(speed == 0)
					direction <= ~direction;
				if(direction == 1 && speed != 0 || speed == 0 && direction == 0)begin
					if(speed == 0)
						speed <= max_speed;
					else
						speed <= speed - 1;
				end 
				else begin
					if(speed == 14 - max_speed)
						speed <= 0;
					else
						speed <= speed + 1;
				end
			end
		end
	end

endmodule

