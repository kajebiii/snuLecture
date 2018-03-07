`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:41 11/07/2017 
// Design Name: 
// Module Name:    operation2 
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
module operation2(
    input [9:0] bits,
    output reg [41:0] display
    );

wire [5:0] nr0, nr1;
bit5magniToComplement mtc0(bits[9:5], nr1[4:0]);
bit5magniToComplement mtc1(bits[4:0], nr0[4:0]);
assign nr1[5:5] = nr1[4:4];
assign nr0[5:5] = nr0[4:4];
wire [5:0] add;
assign add = nr0 + nr1;
wire [5:0] magni;

bit6complementToMagni ctm(add, magni);

wire [6:0] lval, mval, rval;

showFourUnsigned lValue(4'b0, lval);
showOneUnsigned mValue(magni[4:4], mval);
showFourUnsigned rValue(magni[3:0], rval);

always @ (*) begin
	display[41:28] = 0;
	if(magni[5:5] == 1 && magni[4:0] != 0) begin
		display[27:21] = 7'b0000001;
	end else begin
		display[27:21] = 7'b0000000;
	end
	display[20:14] = lval;
	display[13:7] = mval;
	display[6:0] = rval;
end


endmodule



