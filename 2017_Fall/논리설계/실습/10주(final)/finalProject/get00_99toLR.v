`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:58 12/05/2017 
// Design Name: 
// Module Name:    get00_99toLR 
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
module get00_99toLR(
	input clk_50MHz,
	input reset,
	input [6:0] number,
//	output reg [3:0] L,
//	output reg [3:0] R
	output reg [3:0] outL,
	output reg [3:0] outR
    );

reg [6:0] temp;
reg [3:0] i;
reg [3:0] L, R;
always @ (*) begin
	if(number == 7'd110) begin
		L = 11;
		R = 11;
	end else begin 
		if(number >= 7'd111) begin
			if(number == 7'd111) begin
				L = 10;
				R = 10;
			end else begin
				L = 10;
				R = number - 111;
			end
		end else begin
			L = 0; R = 0;
			temp = number;
			for(i=0; i<10; i=i+1) begin
				if(temp >= 10) begin L = L+1; temp = temp-10; end
			end
			R = temp;
		end
	end
end


always @(posedge clk_50MHz or posedge reset)
begin
	if(reset) begin 
		outL = 0;
		outR = 0;
	end else begin
		outL = L;
		outR = R;
	end
end

endmodule






