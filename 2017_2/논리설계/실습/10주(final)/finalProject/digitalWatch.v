`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:48 12/05/2017 
// Design Name: 
// Module Name:    digitalWatch 
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
module digitalWatch(
	input clk_50MHz,
	input clk_5Hz,
	input p_mode,
	input p_set,
	input p_op1,
	input p_op2,
	input p_free,
//	input u_mode,
//	input u_set,
//	input u_op1,
//	input u_op2,
//	input u_free,
	input reset,
	output [41:0] display,
	output reg isWatch, 
	output reg isAlarm, 
	output reg isStop,
	output isAPmode,
	output isSETmode,
	output isAlarmSet
    );
	 
//wire clk_5Hz;
//ClockModulatorTo5Hz cmt5hz(clk_50MHz, reset, clk_5Hz);
//wire p_mode, p_set, p_op1, p_op2, p_free;
//toPulseInput tpi(clk_50MHz, clk_5Hz, reset, u_mode, u_set, u_op1, u_op2, u_free, p_mode, p_set, p_op1, p_op2, p_free);
	 

parameter modeWatch = 2'd0, modeAlarm = 2'd1, modeStop = 2'd2;
 
reg [1:0] modeState = modeWatch;
always @ (modeState) begin
	isWatch = 1'b0;
	isAlarm = 1'b0;
	 isStop = 1'b0;
	case(modeState)
		modeWatch: isWatch = 1'b1;
		modeAlarm: isAlarm = 1'b1;
		modeStop:   isStop = 1'b1;
		default: 
		begin
			isWatch = 1'b0;
			isAlarm = 1'b0;
			 isStop = 1'b0;
		end
	endcase
end


always @ (posedge p_mode or posedge reset) begin
	if(reset) begin
		modeState = modeWatch;
		//something to init others;
	end else begin
		case(modeState)
			modeWatch: modeState = modeAlarm;
			modeAlarm: modeState = modeStop;
			modeStop:  modeState = modeWatch;
			default:   modeState = modeAlarm;
		endcase
	end
end


wire [6:0] printHinWD, printMinWD, printSinWD;
wire [6:0] printHinAD, printMinAD, printSinAD;
wire [20:0] realValueinWD, realValueinAD;
wire [6:0] printHinSD, printMinSD, printSinSD;
wire [5:0] printBlinkinWD, printBlinkinAD, printBlinkinSD;
wire callAlarm = (realValueinWD == realValueinAD);
//wire callAlarm = ((printHinWD == printHinAD) && (printMinWD == printMinAD) && (printSinWD == printSinAD));

watchDisplay wd(clk_50MHz, reset, (modeState == modeWatch),
					 p_set, p_op1, p_op2, callAlarm,
					 isAPmodeinWD, isSETmodeinWD,
					 printHinWD, printMinWD, printSinWD, printBlinkinWD, realValueinWD);
alarmDisplay ad(clk_50MHz, reset, (modeState == modeAlarm),
					 p_set, p_op1, p_op2, p_free, isAPmodeinAD, isSETmodeinAD, isAlarmSet,
					 printHinAD, printMinAD, printSinAD, printBlinkinAD, realValueinAD);
 stopDisplay sd(clk_50MHz, reset, (modeState == modeStop), 
					 p_set, p_op1, p_op2, p_free, 
					printHinSD, printMinSD, printSinSD, printBlinkinSD);

assign isAPmode = ((modeState == modeWatch) ? isAPmodeinWD : ((modeState == modeAlarm) ? isAPmodeinAD : 0));
assign isSETmode = ((modeState == modeWatch) ? isSETmodeinWD : ((modeState == modeAlarm) ? isSETmodeinAD : 0));

wire [6:0] printH = ((modeState == modeWatch) ? printHinWD : ((modeState == modeAlarm) ? printHinAD : printHinSD));
wire [6:0] printM = ((modeState == modeWatch) ? printMinWD : ((modeState == modeAlarm) ? printMinAD : printMinSD));
wire [6:0] printS = ((modeState == modeWatch) ? printSinWD : ((modeState == modeAlarm) ? printSinAD : printSinSD));
wire [5:0] printBlink = ((modeState == modeWatch) ? printBlinkinWD : ((modeState == modeAlarm) ? printBlinkinAD : printBlinkinSD));

wire [41:0] brightDisplay;
showHMStime showHMS(clk_50MHz, clk_5Hz, reset, printH, printM, printS, 
(!isAlarmSet & (modeState == modeAlarm)) ? 0 : isAPmode , printBlink, brightDisplay);



reg freeToggle;
initial begin 
	freeToggle = 0;
end

assign display = (freeToggle & clk_50MHz? 42'b0 : brightDisplay);

always @ (posedge clk_50MHz or posedge reset) begin
	if(reset) begin
		freeToggle = 0;
	end else begin
		if(p_free) freeToggle = ~freeToggle;
	end
end

endmodule















