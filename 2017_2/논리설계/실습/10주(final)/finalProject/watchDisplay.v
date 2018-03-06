`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:48 12/05/2017 
// Design Name: 
// Module Name:    watchDisplay 
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
module watchDisplay(
	input clk_50MHz, 
	input reset,
	input valid,
	input p_set, 
	input p_op1, 
	input p_op2, 
	input p_free,
	output outAPmode,
	output outSETmode,
	output [6:0] printH,
	output [6:0] printM,
	output [6:0] printS,
	output [5:0] printBlink,
	output [20:0] realValue
    );

reg isSETmode = 0, isAPmode = 0;
assign outAPmode = isAPmode;
assign outSETmode = isSETmode;

wire load;
reg settingReset = 0;
reg settingFinish = 0;

wire clk_1Hz; 

wire [6:0] showH, showM, showS;
wire [6:0] setH, setM, setS;
wire [5:0] setBlink;

ClockModulatorTo1Hz cmt1hz(clk_50MHz, reset | load, clk_1Hz);
HMSCounter hmsC(clk_50MHz, clk_1Hz, reset, setH, setM, setS, valid & load, showH, showM, showS);

settingDisplay wsd(clk_50MHz, settingReset, isAPmode, p_set, p_op1, p_op2, p_free, 
						setH, setM, setS, setBlink, load);

reg isAlarming = 0;
assign printH = ((isSETmode == 0) ? showH : setH);
assign printM = ((isSETmode == 0) ? showM : setM);
assign printS = ((isSETmode == 0) ? showS : setS);
assign printBlink = ((isSETmode == 0) ? (isAlarming ? 6'b111111 : 6'b000000) : setBlink);

wire [6:0] realH, realM, realS;
assign realH = ((isSETmode == 0) ? showH : 7'd111);
assign realM = ((isSETmode == 0) ? showM : 7'd111);
assign realS = ((isSETmode == 0) ? showS : 7'd111);
assign realValue = {realH, realM, realS};

wire [5:0] p_ops = {p_free, valid, load, p_set, p_op1, p_op2};
always @ (posedge clk_50MHz or posedge reset) begin
	if(reset) begin
		isAPmode = 0; isSETmode = 0;
		isAlarming = 0; settingFinish = 1;
		settingReset = 1;
	end else begin
		settingReset = 0;
		case(p_ops[5])
			1'b1:isAlarming = 1;
			default: ;
		endcase
		case(p_ops[4:0])
			5'b10000: ;
			5'b10001: isAlarming = 0;
			5'b10010:begin
				if(isSETmode == 0) isAPmode = ~isAPmode;
			end
			5'b10011:begin
				if(isSETmode == 0) isAPmode = ~isAPmode;
			end
			default: begin
				case(p_ops[4:2])
					3'b101:begin
						if(isSETmode == 0) begin isSETmode = 1; settingReset = 1; settingFinish = 0; end
						else begin 
							isSETmode = 1; 
						end
					end
					default: begin
						case(p_ops[4:3])
							2'b11: begin isSETmode = 0; settingFinish = 1; end
							default:; //not valid;
						endcase
					end
				endcase
			end
		endcase
	end
end

endmodule


