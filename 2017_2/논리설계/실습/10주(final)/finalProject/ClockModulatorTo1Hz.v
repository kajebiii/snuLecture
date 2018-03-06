`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:26 12/05/2017 
// Design Name: 
// Module Name:    ClockModulatorTo1Hz 
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
module ClockModulatorTo1Hz(
	input clk_50MHz,
	input reset,
	output reg clk_1Hz
);

reg[29:0] count;

initial begin
	count = 0;
	clk_1Hz = 0;
end

always @(posedge clk_50MHz or posedge reset)
begin
	if(reset)
	begin
		count = 0;
		clk_1Hz = 0;
	end
	else
	begin
		count = count + 1;
		if (count >= 25000000)
		begin
			clk_1Hz = !clk_1Hz;
			count = 0;
		end
	end
end

endmodule
