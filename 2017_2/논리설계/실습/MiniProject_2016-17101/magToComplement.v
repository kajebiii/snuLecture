`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:06 11/07/2017 
// Design Name: 
// Module Name:    magniToComplement 
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
module bit5magniToComplement(
		input [4:0] magni,
		output reg [4:0] compl
    );

always @ (*) begin
	compl = magni;
	if(magni[4:4] == 1) begin
		compl[3:0] = ~magni[3:0];
		compl = compl + 1;
	end
end

endmodule
