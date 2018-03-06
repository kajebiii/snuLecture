`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:24:58 11/07/2017 
// Design Name: 
// Module Name:    bit6complementToMagni 
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
module bit6complementToMagni(
		input [5:0] compl,
		output reg [5:0] magni
    );

always @ (*) begin
	magni = compl;
	if(compl[5:5] == 1) begin
		magni[4:0] = ~compl[4:0];
		magni = magni + 1;
	end
end

endmodule 
