`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:10 12/05/2017 
// Design Name: 
// Module Name:    stopDisplay 
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
module stopDisplay(
	input clk_50MHz,
	input reset,
	input valid,
	input p_set, 
	input p_op1, 
	input p_op2, 
	input p_free,
	output reg [6:0] printH,
	output reg [6:0] printM,
	output [6:0] printS,
	output [5:0] printBlink
    );

reg isStop, load;

wire [6:0] valH, valM;

ClockModulatorTo100Hz cmt100hz(clk_50MHz, reset, clk_100Hz);
MSMSCounter msmsC(clk_50MHz, clk_100Hz, reset, 7'b0, 7'b0, 7'b0, load, isStop, valH, valM, printS);
assign printBlink = 6'b0;

reg [6:0] calcH, calcM;
always @ (*) begin
	if(valH < 7'd10) begin
		calcH = 111 + valH;
	end else begin
		calcH = valH;
	end
	if((valH == 7'd0) && (valM < 7'd10)) begin
		calcM = 111 + valM;
	end else begin
		calcM = valM;
	end
end


initial begin
	isStop = 1;
	load = 1;
end

wire [3:0] p_ops = {valid, p_set, p_op1, p_op2};
always @ (posedge clk_50MHz or posedge reset) begin
	if(reset) begin
		isStop = 1;
		load = 1;
	end else begin
		printH = calcH;
		printM = calcM;
		load = 0;
		case(p_ops)
			4'b1000: ;
			4'b1001: ;
			4'b1010:begin if(isStop == 1) load = 1; end
			4'b1011:begin if(isStop == 1) load = 1; end
			default: begin
				case(p_ops[3:2])
					2'b11:begin isStop = ~isStop; end
					default:;
				endcase
			end
		endcase
						
	end
end


endmodule
