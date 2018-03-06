`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:35 12/05/2017 
// Design Name: 
// Module Name:    showHMStime 
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
module showHMStime(
	input clk_50MHz,
	input clk_5Hz, 
	input reset, 
	input [6:0] showH,
	input [6:0] showM,
	input [6:0] showS,
	input isAPmode,
	input [5:0] blink,
	output [41:0] display
    );
	 

	 
wire [3:0] showHL, showHR, showML, showMR, showSL, showSR;
wire isP = (showH >= 12);
wire [6:0] APmodeH = (showH >= 13 ? showH - 12 : (showH == 0 ? 4'd12 : showH));
wire [3:0] APmodeHL, APmodeHR;
get00_99toLR lr0(clk_50MHz, reset, showH, showHL, showHR);
get00_99toLR lr1(clk_50MHz, reset, showM, showML, showMR);
get00_99toLR lr2(clk_50MHz, reset, showS, showSL, showSR);
get00_99toLR lr3(clk_50MHz, reset, APmodeH, APmodeHL, APmodeHR);

wire [41:0] display0;
wire [20:0] display1;

showFourUnsigned sf00(clk_50MHz, reset, showHL, display0[41:35]);
showFourUnsigned sf01(clk_50MHz, reset, showHR, display0[34:28]);
showFourUnsigned sf02(clk_50MHz, reset, showML, display0[27:21]);
showFourUnsigned sf03(clk_50MHz, reset, showMR, display0[20:14]);
showFourUnsigned sf04(clk_50MHz, reset, showSL, display0[13: 7]);
showFourUnsigned sf05(clk_50MHz, reset, showSR, display0[ 6: 0]);

//P 7'b1100111 //A 7'b1110111
assign display1[20:14] = (isP ? 7'b1100111 : 7'b1110111);
showFourUnsigned sf12(clk_50MHz, reset, APmodeHL, display1[13: 7]);
showFourUnsigned sf13(clk_50MHz, reset, APmodeHR, display1[ 6: 0]);

assign display[41:35] = (~blink[5] | ~clk_5Hz) ? (isAPmode ? display1[20:14] : display0[41:35]) : 0;
assign display[34:28] = (~blink[4] | ~clk_5Hz) ? (isAPmode ?               0 : display0[34:28]) : 0;
assign display[27:21] = (~blink[3] | ~clk_5Hz) ? (isAPmode ? display1[13: 7] : display0[27:21]) : 0;
assign display[20:14] = (~blink[2] | ~clk_5Hz) ? (isAPmode ? display1[ 6: 0] : display0[20:14]) : 0;
assign display[13: 7] = (~blink[1] | ~clk_5Hz) ? (isAPmode ? display0[27:21] : display0[13: 7]) : 0;
assign display[ 6: 0] = (~blink[0] | ~clk_5Hz) ? (isAPmode ? display0[20:14] : display0[ 6: 0]) : 0;

endmodule
