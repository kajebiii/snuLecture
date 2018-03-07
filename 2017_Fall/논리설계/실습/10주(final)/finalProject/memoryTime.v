`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:11 12/06/2017 
// Design Name: 
// Module Name:    memoryTime 
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
module memoryTime(
	input clk_50MHz,
	input reset,
	input [6:0] loadH,
	input [6:0] loadM,
	input [6:0] loadS,
	input load,
	output [6:0] outH,
	output [6:0] outM,
	output [6:0] outS
    );

reg [6:0] nowH, nowM;

assign outH = nowH;
assign outM = nowM;
assign outS = 0;

initial begin
	nowH = 7'b0; nowM = 7'b0;
end

always @ (posedge reset or posedge clk_50MHz) begin
	if(reset) begin
		nowH = 7'b0; nowM = 7'b0;
	end else begin
		case(load) 
			1'b0:;
			1'b1:
				begin nowH = loadH; nowM = loadM; end
			default:;
		endcase
	end
end

endmodule

