`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:37 12/11/2017 
// Design Name: 
// Module Name:    HandShaker 
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
module HandShaker(
	input clk_50MHz,
	input clk_5Hz,
	input [2:0] in_instruction,
	input ack,
	output reg [2:0] instruction,
	output reg req
    );


parameter s_00 = 3'd0, s_11 = 3'd1, s_01 = 3'd2, s_10 = 3'd3;
parameter s_wait0 = 3'd4, s_wait1 = 3'd5;
parameter cs_0 = 2'd0, cs_11 = 2'd1, cs_01 = 2'd2;

reg n_req = 0;
reg [2:0] n_instruction = 3'b000;
reg [2:0] state = s_11, next_state = s_11;
reg [1:0] cstate = s_11, next_cstate = s_11;
reg [15:0] cnt = 0, next_cnt = 0;

always @ (*) begin
	case (state)
		s_00: next_state = (ack == 1'b1) ? s_01 : s_00;
		s_11: next_state = (ack == 1'b1) ? s_11 : s_10;
		s_01: next_state = (ack == 1'b1) ? s_11 : s_10;
		s_10: next_state = (ack == 1'b1) ? s_01 : s_00;
		default:next_state = s_00;
	endcase
	case (cstate)
		cs_0: next_cstate = (clk_5Hz == 1'b1) ? cs_01 : cs_0;
		cs_11:next_cstate = (clk_5Hz == 1'b1) ? cs_11 : cs_0;
		cs_01:next_cstate = (clk_5Hz == 1'b1) ? cs_11 : cs_0;
		default:next_cstate = cs_0;
	endcase
	next_cnt = cnt;
	case(state)
		s_00:begin
//			n_req = 1;
			n_instruction = 0;
			n_req = (cnt >= 8 ? 1 : 0);
			if(cstate == cs_01) next_cnt = cnt + 1;
		end
		s_10:begin
			n_req = 0;
			n_instruction = 0;
		end
		s_11:begin
			n_req = 0;
			n_instruction = 0;
		end
		s_01:begin
			n_req = 0;
			n_instruction = in_instruction;
			next_cnt = 0;
		end
		default:;
	endcase
end

always @ (posedge clk_50MHz) begin
	req = n_req;
	state = next_state;
	instruction = n_instruction;
	cstate = next_cstate;
	cnt = next_cnt;
end

endmodule
