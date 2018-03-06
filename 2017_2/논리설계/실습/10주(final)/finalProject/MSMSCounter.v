`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:49 12/06/2017 
// Design Name: 
// Module Name:    MSMSCounter 
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
module MSMSCounter(
	input clk_50MHz,
	input clk_100Hz,
	input reset,
	input [6:0] loadH,
	input [6:0] loadM,
	input [6:0] loadS,
	input load,
	input isStop,
	output [6:0] outH,
	output [6:0] outM,
	output [6:0] outS
    );

reg [6:0] nowH, nowM, nowS;
reg [6:0] nextH, nextM, nextS;

assign outH = nowH;
assign outM = nowM;
assign outS = nowS;

initial begin
	nowH = 7'b0; nowM = 7'b0; nowS = 7'b0;
end

always @ (*) begin
	nextH = nowH; nextM = nowM; nextS = nowS + 1;
	if(nextS == 7'd100) begin nextS = 0; nextM = nextM + 1; end
	if(nextM == 7'd60) begin nextM = 0; nextH = nextH + 1; end
	if(nextH == 7'd60) begin
		nextH = 7'd59;
		nextM = 7'd59;
		nextS = 7'd99;		
	end
end


parameter s_0 = 2'd0;
parameter s_11 = 2'd1;
parameter s_01 = 2'd2;

reg[1:0] state = 0, next_state = 0;

always @(*) begin
	case (state)
		s_0:
			next_state = (clk_100Hz == 1'b1) ? s_01 : s_0;
		s_11:
			next_state = (clk_100Hz == 1'b1) ? s_11 : s_0;
		s_01:
			next_state = (clk_100Hz == 1'b1) ? s_11 : s_0;
		default:
			next_state = s_0;
	endcase
end

wire output_signal = (state == s_01) ? 1'b1:1'b0;
wire [2:0] oper = {load, isStop, output_signal};

always @ (posedge reset or posedge clk_50MHz) begin
	if(reset) begin
		nowH = 7'b0; nowM = 7'b0; nowS = 7'b0;
		state = s_0;
	end else begin
		state = next_state;
		case(oper) 
			3'b000:;
			3'b001:
				begin nowH = nextH; nowM = nextM; nowS = nextS; end
			3'b010:;
			3'b011:;
			default:
				begin nowH = loadH; nowM = loadM; nowS = loadS; end
		endcase
	end
end

endmodule


