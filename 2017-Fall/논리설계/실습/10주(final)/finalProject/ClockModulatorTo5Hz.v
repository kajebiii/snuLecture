`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:35 12/06/2017 
// Design Name: 
// Module Name:    ClockModulatorTo5Hz 
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
module ClockModulatorTo5Hz(
	input clk_50MHz,
	input reset,
	output reg clk_5Hz
);

reg[25:0] count;

initial begin
	count = 0;
	clk_5Hz = 0;
end

always @(posedge clk_50MHz or posedge reset)
begin
	if(reset)
	begin
		count = 0;
		clk_5Hz = 0;
	end
	else
	begin
		count = count + 1;
		if (count >= 5000000)
		begin
			clk_5Hz = !clk_5Hz;
			count = 0;
		end
	end
end

endmodule