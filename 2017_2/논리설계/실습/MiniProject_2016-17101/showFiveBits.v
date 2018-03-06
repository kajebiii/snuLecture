`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:50 11/07/2017 
// Design Name: 
// Module Name:    showFiveBits 
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
module showFiveBits(
    input [4:0] bits,
    output reg [20:0] display
    );

wire [6:0] lval, rval;

showFourUnsigned lValue(4'b0, lval);
showFourUnsigned rValue(bits[3:0], rval);

always @ (*) begin
	if(bits[4:4] == 1 && bits[3:0] != 0) begin
		display[20:14] = 7'b0000001;
	end else begin
		display[20:14] = 7'b0000000;
	end
	display[13:7] = lval;
	display[6:0] = rval;
end

endmodule
