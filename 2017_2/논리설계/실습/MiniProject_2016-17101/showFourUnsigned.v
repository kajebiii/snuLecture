`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:00:27 11/07/2017 
// Design Name: 
// Module Name:    showFourUnsigned 
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
module showFourUnsigned(
    input [3:0] bits,
    output reg [6:0] display
    );

always @ (*) begin
	case (bits)
		4'd00: display = 7'b1111110;
		4'd01: display = 7'b0110000;
		4'd02: display = 7'b1101101;
		4'd03: display = 7'b1111001;
		4'd04: display = 7'b0110011;
		4'd05: display = 7'b1011011;
		4'd06: display = 7'b1011111;
		4'd07: display = 7'b1110000;
		4'd08: display = 7'b1111111;
		4'd09: display = 7'b1111011;
		4'd10: display = 7'b1110111;
		4'd11: display = 7'b0011111;
		4'd12: display = 7'b1001110;
		4'd13: display = 7'b0111101;
		4'd14: display = 7'b1001111;
		4'd15: display = 7'b1000111;
		default: display = 7'b0000000;
	endcase
end

endmodule 
