`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:12:06 12/06/2017 
// Design Name: 
// Module Name:    ClockModulatorTo100Hz 
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
module ClockModulatorTo100Hz(
	input clk_50MHz,
	input reset,
	output reg clk_100Hz
);

reg[20:0] count;

initial begin
	count = 0;
	clk_100Hz = 0;
end

always @(posedge clk_50MHz or posedge reset)
begin
	if(reset)
	begin
		count = 0;
		clk_100Hz = 0;
	end
	else
	begin
		count = count + 1;
		if (count >= 250000)
		begin
			clk_100Hz = !clk_100Hz;
			count = 0;
		end
	end
end

endmodule
