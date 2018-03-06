`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:41 12/05/2017 
// Design Name: 
// Module Name:    PulseGenerator 
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
module PulseGenerator(
	input clk,
	input clk_5Hz, 
	input input_signal,
	input reset,
	output reg output_signal
);
parameter s_0 = 2'd0, s_11 = 2'd1, s_01 = 2'd2;
parameter cs_0 = 2'd0, cs_11 = 2'd1, cs_01 = 2'd2;
parameter cnt_0 = 3'd0, cnt_1 = 3'd1, cnt_2 = 3'd2, cnt_3 = 3'd3, cnt_4 = 3'd4, cnt_5 = 4'd5;

reg[1:0] state, next_state;
reg[1:0] cstate, next_cstate;
reg[2:0] counter, nextCounter;

wire nextSignal;
assign nextSignal = (state == s_01 | (state == s_11 && counter == cnt_4)) ? 1'b1:1'b0;

always @(*) begin
	case (state)
		s_0: next_state = (input_signal == 1'b1) ? s_01 : s_0;
		s_11:next_state = (input_signal == 1'b1) ? s_11 : s_0;
		s_01:next_state = (input_signal == 1'b1) ? s_11 : s_0;
		default:next_state = s_0;
	endcase
	case (cstate)
		cs_0: next_cstate = (clk_5Hz == 1'b1) ? cs_01 : cs_0;
		cs_11:next_cstate = (clk_5Hz == 1'b1) ? cs_11 : cs_0;
		cs_01:next_cstate = (clk_5Hz == 1'b1) ? cs_11 : cs_0;
		default:next_cstate = cs_0;
	endcase
	case (counter)
		cnt_0:
			nextCounter = (state == s_11) ? (cstate == cs_01 ? cnt_1 : cnt_0) : cnt_0;
		cnt_1:
			nextCounter = (state == s_11) ? (cstate == cs_01 ? cnt_2 : cnt_1) : cnt_0;
		cnt_2:
			nextCounter = (state == s_11) ? (cstate == cs_01 ? cnt_3 : cnt_2) : cnt_0;
		cnt_3:
			nextCounter = (state == s_11) ? (cstate == cs_01 ? cnt_4 : cnt_3) : cnt_0;
		cnt_4:
			nextCounter = (state == s_11) ? cnt_5 : cnt_0;
		cnt_5:
			nextCounter = (state == s_11) ? (cstate == cs_01 ? cnt_4 : cnt_5) : cnt_0;
		default:
			nextCounter = s_0;
	endcase
end

always @(posedge clk or posedge reset) begin
	if(reset) begin
		state = s_0;
		cstate = cs_0;
		counter = 0;
	end else begin
		state = next_state;
		cstate = next_cstate;
		output_signal = nextSignal;
		counter = nextCounter;
	end
end


endmodule
