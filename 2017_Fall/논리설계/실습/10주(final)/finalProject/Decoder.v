`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:40 12/11/2017 
// Design Name: 
// Module Name:    Decoder 
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
module Decoder(
	input clk_50MHz,
	input [2:0] instruction,
	output reg mode,
	output reg set,
	output reg op1,
	output reg op2,
	output reg reset
    );

reg n_mode = 0, n_set = 0, n_op1 = 0, n_op2 = 0, n_reset = 0;
always @ (*) begin
	n_mode = 0; n_set = 0; n_op1 = 0; n_op2 = 0; n_reset = 0;
	case(instruction) 
		3'b000:;
		3'b001:n_reset = 1;
		3'b011:n_mode = 1;
		3'b100:n_set = 1;
		3'b101:n_op1 = 1;
		3'b110:n_op2 = 1;
		3'b111:;
		default:;
	endcase
end

always @ (posedge clk_50MHz) begin
	mode = n_mode;
	set = n_set;
	op1 = n_op1;
	op2 = n_op2;
	reset = n_reset;
end

endmodule





