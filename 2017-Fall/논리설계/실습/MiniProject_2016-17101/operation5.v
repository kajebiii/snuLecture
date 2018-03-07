`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:13 11/07/2017 
// Design Name: 
// Module Name:    operation5 
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
module operation5(
    input [9:0] bits,
    output reg [41:0] display
    );
	 
wire [5:0] goL, goR;
assign goR = bits[8:3] >> bits[2:0];
assign goL = bits[8:3] << bits[2:0];

wire [41:0] lval, rval;

operation1 getLval(goL, lval);
operation1 getRval(goR, rval);

always @ (*) begin
	if(bits[9:9] == 0) begin
		display = lval; 
	end else begin
		display = rval;
	end
end

endmodule



