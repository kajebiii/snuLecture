`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:13 11/07/2017 
// Design Name: 
// Module Name:    operation0 
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
module operation0(
    input [9:0] dip,
    output [41:0] display
    );

showFiveBits num0(dip[9:5], display[41:21]);
showFiveBits num1(dip[4:0], display[20:0]);


endmodule
