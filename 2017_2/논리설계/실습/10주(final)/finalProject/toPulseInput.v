`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:02 12/05/2017 
// Design Name: 
// Module Name:    toPulseInput 
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
module toPulseInput(
	input clk_50MHz,
	input clk_5Hz,
	input reset, 
	input u_mode,
	input u_set,
	input u_op1,
	input u_op2,
	input u_free,
	output p_mode,
	output p_set,
	output p_op1,
	output p_op2,
	output p_free
    );
wire d_mode, d_set, d_op1, d_op2, d_free;
wire clk_1KHz;
ClockModulatorTo1KHz cm1K(clk_50MHz, reset, clk_1KHz);
Debouncer deb0(clk_1KHz, u_mode, d_mode);
Debouncer deb1(clk_1KHz, u_set , d_set );
Debouncer deb2(clk_1KHz, u_op1 , d_op1 );
Debouncer deb3(clk_1KHz, u_op2 , d_op2 );
Debouncer deb4(clk_1KHz, u_free, d_free);
PulseGenerator pul0(clk_50MHz, clk_5Hz, d_mode, reset, p_mode);
PulseGenerator pul1(clk_50MHz, clk_5Hz, d_set , reset, p_set );
PulseGenerator pul2(clk_50MHz, clk_5Hz, d_op1 , reset, p_op1 );
PulseGenerator pul3(clk_50MHz, clk_5Hz, d_op2 , reset, p_op2 );
PulseGenerator pul4(clk_50MHz, clk_5Hz, d_free, reset, p_free);


endmodule
