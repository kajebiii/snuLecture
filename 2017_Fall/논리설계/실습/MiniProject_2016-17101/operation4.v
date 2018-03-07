`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:48 11/07/2017 
// Design Name: 
// Module Name:    operation4 
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
module operation4(
    input [5:0] bits,
    output reg [41:0] display
    );

wire[6:0] zero1, lval, rval;
wire[3:0] lcount, rcount;
assign lcount = ((bits[0] == 1) + (bits[1] == 1) + (bits[2] == 1) + (bits[3] == 1) + (bits[4] == 1) + (bits[5] == 1));
assign rcount = ((bits[0] == 0) + (bits[1] == 0) + (bits[2] == 0) + (bits[3] == 0) + (bits[4] == 0) + (bits[5] == 0));

showOneUnsigned makeZero0(1'b0, zero0);
showFourUnsigned lValue(lcount, lval);
showFourUnsigned rValue(rcount, rval);

always @ (*) begin
	display[41:35] = 0;
	display[34:28] = zero0;
	display[27:21] = lval;
	display[20:14] = 0;
	display[13:7] = zero0;
	display[6:0] = rval;
end

endmodule
