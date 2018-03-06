`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:11 11/07/2017 
// Design Name: 
// Module Name:    allOperations 
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
module allOperations(
    input [9:0] dip,
	 input [5:0] sw,
    output reg [41:0] display
    );

wire[293:0] result;

operation0 op0(dip, result[41:0]);
operation1 op1(dip[5:0], result[83:42]);
operation2 op2(dip, result[125:84]);
operation3 op3(dip, result[167:126]);
operation4 op4(dip[5:0], result[209:168]);
operation5 op5(dip, result[251:210]);
operation6 op6(dip[5:0], result[293:252]);

always @ (*) begin
	if(sw == 0) begin
		display = result[41:00];
	end else begin if(sw[0] == 1) begin
		display = result[83:42];
	end else begin if(sw[1] == 1) begin
		display = result[125:84];
	end else begin if(sw[2] == 1) begin
		display = result[167:126];
	end else begin if(sw[3] == 1) begin
		display = result[209:168];	
	end else begin if(sw[4] == 1) begin
		display = result[251:210];	
	end else begin if(sw[5] == 1) begin
		display = result[293:252];	
	end end end end end end end
end

endmodule 