`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:26:04 12/11/2017 
// Design Name: 
// Module Name:    ProgrammableWatch 
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
module ProgrammableWatch(
	input clk_50MHz,
	input [2:0] instruction,
	input ack,
	output req,
	output [41:0] display,
	output isWatch, 
	output isAlarm, 
	output isStop,
	output isAPmode,
	output isSETmode,
	output isAlarmSet
    );


wire clk_5Hz;
ClockModulatorTo5Hz cmt5hz(clk_50MHz, 0, clk_5Hz);


wire [2:0] p_instruction;
//assign req = 1;
//assign p_instruction = 0;
HandShaker hs(clk_50MHz, clk_5Hz, instruction, ack, p_instruction, req);

wire p_mode, p_set, p_op1, p_op2, p_free, reset;
//assign p_mode = 0; assign p_set = 0; assign p_op1 = 0; assign p_op2 = 0; assign p_free = 0; assign reset = 0;
assign p_free = 0;
Decoder dc(clk_50MHz, p_instruction, p_mode, p_set, p_op1, p_op2, reset);

//wire isAPmodeTest, isSETmodeTest, isAlarmSetTest, isStopTest, isAlarmTest;
//assign isAlarm = ack;
//assign isStop = req;
//assign isAPmode = p_instruction_test[2];
//assign isSETmode = p_instruction_test[1];
//assign isAlarmSet = p_instruction_test[0];
digitalWatch dw(clk_50MHz, clk_5Hz, p_mode, p_set, p_op1, p_op2, p_free, reset, display, 
isWatch, isAlarm, isStop, isAPmode, isSETmode, isAlarmSet);


endmodule
