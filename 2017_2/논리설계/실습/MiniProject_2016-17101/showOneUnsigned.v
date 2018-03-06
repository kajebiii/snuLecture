`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:34 11/07/2017 
// Design Name: 
// Module Name:    showOneUnsigned 
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
module showOneUnsigned(
    input onebit,
    output reg [6:0] display
    );

always @ (*) begin
	case (onebit)
		0: display = 7'b1111110;
		1: display = 7'b0110000;
		default: display = 7'b0000000;
	endcase
end

endmodule 