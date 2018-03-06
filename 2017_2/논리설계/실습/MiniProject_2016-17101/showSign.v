`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:27 11/07/2017 
// Design Name: 
// Module Name:    showSign 
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
module showSign(
    input sign,
    output reg [6:0] display
    );
	 
always @ (*) begin
	case (sign)
		0: display = 7'b0000000;
		1: display = 7'b0000001;
	endcase
end


endmodule 