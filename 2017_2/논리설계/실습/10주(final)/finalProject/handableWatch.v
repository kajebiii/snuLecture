`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:44 12/11/2017 
// Design Name: 
// Module Name:    handableWatch 
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
module handableWatch(
	input clk_50MHz,
	input u_mode,
	input u_set,
	input u_op1,
	input u_op2,
	input u_free,
	input reset,
	output [41:0] display,
	output isWatch, 
	output isAlarm, 
	output isStop,
	output isAPmode,
	output isSETmode,
	output isAlarmSet
    );

wire clk_5Hz;
ClockModulatorTo5Hz cmt5hz(clk_50MHz, reset, clk_5Hz);

wire p_mode, p_set, p_op1, p_op2, p_free;
toPulseInput tpi(clk_50MHz, clk_5Hz, reset, u_mode, u_set, u_op1, u_op2, u_free, p_mode, p_set, p_op1, p_op2, p_free);

digitalWatch dw(clk_50MHz, clk_5Hz, p_mode, p_set, p_op1, p_op2, p_free, reset, display, isWatch, isAlarm, isStop, isAPmode, isSETmode, isAlarmSet);

endmodule
