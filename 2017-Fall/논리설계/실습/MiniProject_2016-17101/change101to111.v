`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:50 11/07/2017 
// Design Name: 
// Module Name:    change101to111 
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
module change101to111(
		input [5:0] before,
		output reg [5:0] after
    );

always @ (*) begin
	after = before;
	if(after[5:3] == 3'b101) begin
		after[4:4] = 1;
	end
	if(after[4:2] == 3'b101) begin
		after[3:3] = 1;
	end
	if(after[3:1] == 3'b101) begin
		after[2:2] = 1;
	end
	if(after[2:0] == 3'b101) begin
		after[1:1] = 1;
	end	
end

endmodule
