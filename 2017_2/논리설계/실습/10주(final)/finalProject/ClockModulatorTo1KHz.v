`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:50 12/05/2017 
// Design Name: 
// Module Name:    ClockModulatorTo1KHz 
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
module ClockModulatorTo1KHz(
	input clk_50MHz,
	input reset,
	output reg clk_1KHz
);

reg[14:0] count;

initial begin
	count = 0;
	clk_1KHz = 0;
end

always @(posedge clk_50MHz or posedge reset)
begin
	if(reset)
	begin
		count = 0;
	end
	else
	begin
		count = count + 1;
		if (count >= 2500)
		begin
			clk_1KHz = !clk_1KHz;
			count = 0;
		end
	end
end

endmodule
