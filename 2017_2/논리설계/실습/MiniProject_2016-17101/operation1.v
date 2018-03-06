`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:33 11/07/2017 
// Design Name: 
// Module Name:    operation1 
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
module operation1(
    input [5:0] bits,
    output [41:0] display
    );


showOneUnsigned showValue5(bits[5:5], display[41:35]);
showOneUnsigned showValue4(bits[4:4], display[34:28]);
showOneUnsigned showValue3(bits[3:3], display[27:21]);
showOneUnsigned showValue2(bits[2:2], display[20:14]);
showOneUnsigned showValue1(bits[1:1], display[13:07]);
showOneUnsigned showValue0(bits[0:0], display[06:00]);

endmodule 