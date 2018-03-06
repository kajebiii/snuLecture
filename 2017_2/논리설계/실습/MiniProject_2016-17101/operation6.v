`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:55:49 11/07/2017 
// Design Name: 
// Module Name:    operation6 
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
module operation6(
    input [5:0] bits,
    output [41:0] display
    );
	 
wire [5:0] change;

change101to111 doChange(bits, change);
operation1 useOp1(change, display);


endmodule
