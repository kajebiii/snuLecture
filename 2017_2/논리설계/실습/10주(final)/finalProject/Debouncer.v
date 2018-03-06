`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    13:40:12 12/05/2017
// Design Name:
// Module Name:    Debouncer
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
module Debouncer(
input clk,
input data_in,
output reg data_out
    );
    
reg [6:0] counter = 7'b0;

always @(posedge clk)
begin
    if(!data_in) counter = 0;
    else begin
        if(counter < 100) begin
            counter = counter + 1;
        end
    end
    
    if(counter >= 100) data_out = 1;
    else data_out = 0;
end

endmodule


