`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:54 12/05/2017 
// Design Name: 
// Module Name:    settingDisplay 
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
module settingDisplay(
	input clk_50MHz, 
	input reset,
	input isAPmode,
	input p_set,
	input p_op1, 
	input p_op2, 
	input p_free,
	output [6:0] setH,
	output [6:0] setM,
	output [6:0] setS,
	output [5:0] setBlink,
	output reg load
    );

reg [6:0] nowH, nowM, nowS;
reg [1:0] setCnt, nextSetCnt;
reg [5:0] blink;

assign setBlink = blink;
assign setH = nowH;
assign setM = nowM;
assign setS = nowS;


reg [6:0] isH1, isM1;
reg [6:0] isH2, isM2;
reg nextLoad;
always @ (*) begin
	nextSetCnt = setCnt + 1;
	if(isAPmode == 0) if(nextSetCnt == 2) nextSetCnt = 0;
	if(isAPmode == 1) if(nextSetCnt == 3) nextSetCnt = 0;
	if(nextSetCnt == 0) nextLoad = 1; else nextLoad = 0;
	
	if(isAPmode == 0) begin
		case(setCnt)
			2'd0: blink = 6'b110000;
			2'd1: blink = 6'b001100;
			default: blink = 0;
		endcase
	end else begin
		case(setCnt)
			2'd0: blink = 6'b100000;
			2'd1: blink = 6'b001100;
			2'd2: blink = 6'b000011;
			default: blink = 0;
		endcase
	end
	
	isH1 = nowH; isH2 = nowH;
	isM1 = nowM; isM2 = nowM;
	if(isAPmode == 0) begin
		if(setCnt == 0) begin
			if(nowH == 23) isH1 = 0;
			else isH1 = nowH + 1;
			if(nowH == 0) isH2 = 23;
			else isH2 = nowH - 1;
		end else if(setCnt == 1) begin
			if(nowM == 59) isM1 = 0;
			else isM1 = nowM + 1;
			if(nowM == 0) isM2 = 59;
			else isM2 = nowM - 1;
		end
	end else begin
		if(setCnt == 0) begin
			if(nowH < 12) isH1 = nowH + 12;
			else isH1 = nowH - 12;
			if(nowH < 12) isH2 = nowH + 12;
			else isH2 = nowH - 12;
		end else if(setCnt == 1) begin
			if(nowH == 23) isH1 = 0;
			else isH1 = nowH + 1;
			if(nowH == 0) isH2 = 23;
			else isH2 = nowH - 1;
		end else if(setCnt == 2) begin
			if(nowM == 59) isM1 = 0;
			else isM1 = nowM + 1;
			if(nowM == 0) isM2 = 59;
			else isM2 = nowM - 1;
		end
	end
end

initial begin
	nowH = 0; nowM = 0; nowS = 0;
	setCnt = 0;
	load = 0;
end

wire [2:0] p_ops = {p_set, p_op1, p_op2};
always @ (posedge clk_50MHz or posedge reset) begin
	if(reset) begin
		nowH = 0; nowM = 0; nowS = 0;
		setCnt = 0;
		load = 0;
	end else  begin
		load = 0;
		case(p_ops)
			3'b000: nowH = nowH;
			3'b001: begin nowH = isH2; nowM = isM2; end
			3'b010: begin nowH = isH1; nowM = isM1; end
			3'b011: nowH = nowH;
			default: begin
				setCnt = nextSetCnt;
				load = nextLoad;
			end
		endcase
	end
//	nowH = nowH + 1;
end



endmodule
