`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:58 12/05/2017 
// Design Name: 
// Module Name:    alarmDisplay 
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
module alarmDisplay(
	input clk_50MHz,
	input reset,
	input valid,
	input p_set, 
	input p_op1, 
	input p_op2, 
	input p_free,
	output outAPmode,
	output outSETmode,
	output outAlarmSet,
	output [6:0] printH,
	output [6:0] printM,
	output [6:0] printS,
	output [5:0] printBlink,
	output [20:0] realValue
    );

reg isSETmode = 0, isAPmode = 0, isAlarmSet = 0;
assign outAPmode = isAPmode;
assign outSETmode = isSETmode;
assign outAlarmSet = isAlarmSet;


wire load;
reg settingReset = 0;


wire [6:0] showH, showM, showS;
wire [5:0] showBlink;
assign showBlink = 0;
wire [6:0] setH, setM, setS;
wire [5:0] setBlink;

memoryTime memoT(clk_50MHz, reset, setH, setM, setS, valid & load, showH, showM, showS);

settingDisplay wsd(clk_50MHz, settingReset, isAPmode, p_set, p_op1, p_op2, p_free, 
						setH, setM, setS, setBlink, load);

assign printH = ((isAlarmSet) ? (showH) : ((isSETmode == 0) ? 7'd110 : setH));
assign printM = ((isAlarmSet) ? (showM) : ((isSETmode == 0) ? 7'd110 : setM));
assign printS = ((isAlarmSet) ? (showS) : ((isSETmode == 0) ? 7'd110 : setS));
assign printBlink = ((isSETmode == 0) ? showBlink : setBlink);

wire [6:0] realH, realM, realS;
assign realH = (isAlarmSet ? showH : 7'd110);
assign realM = (isAlarmSet ? showM : 7'd110);
assign realS = (isAlarmSet ? showS : 7'd110);
assign realValue = {realH, realM, realS};

wire [4:0] p_ops = {valid, load, p_set, p_op1, p_op2};
always @ (posedge clk_50MHz or posedge reset) begin
	if(reset) begin
		isAPmode = 0; isSETmode = 0; isAlarmSet = 0;
		settingReset = 1;
	end else begin
		settingReset = 0;
		case(p_ops)
			5'b10000: ;
			5'b10001: 
				if(isSETmode == 0) isAlarmSet = 0;
			5'b10010:begin
				if(isSETmode == 0) isAPmode = ~isAPmode;
			end
			5'b10011:begin
				if(isSETmode == 0) isAPmode = ~isAPmode;
			end
			default: begin
				case(p_ops[4:2])
					3'b101:begin
						if(isSETmode == 0) begin isSETmode = 1; settingReset = 1; isAlarmSet = 0; end
						else begin 
							isSETmode = 1; 
						end
					end
					default: begin
						case(p_ops[4:3])
							2'b11: begin isSETmode = 0; isAlarmSet = 1; end
							default:; //not valid
						endcase
					end
				endcase
			end
		endcase
						
	end
end

endmodule


