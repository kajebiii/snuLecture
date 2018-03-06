`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:33:30 11/07/2017 
// Design Name: 
// Module Name:    operation3 
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
module operation3(
    input [9:0] bits,
    output reg [41:0] display
    );

wire [8:0] mul;
assign mul[8:8] = bits[9:9] ^ bits[4:4];
assign mul[7:0] = bits[8:5] * bits[3:0];

wire [6:0] lval, mval, rval;

showFourUnsigned lValue(4'b0, lval);
showFourUnsigned mValue(mul[7:4], mval);
showFourUnsigned rValue(mul[3:0], rval);

always @ (*) begin
	display[41:28] = 0;
	if(mul[8:8] == 1 && mul[7:0] != 0) begin
		display[27:21] = 7'b0000001;
	end else begin
		display[27:21] = 7'b0000000;
	end
	display[20:14] = lval;
	display[13:7] = mval;
	display[6:0] = rval;
end


endmodule
