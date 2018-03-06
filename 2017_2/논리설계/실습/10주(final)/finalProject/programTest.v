`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:58:05 12/11/2017
// Design Name:   ProgrammableWatch
// Module Name:   /csehome/qja0950/finalProject/programTest.v
// Project Name:  finalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ProgrammableWatch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module programTest;

	// Inputs
	reg clk_50MHz;
	reg [2:0] instruction;
	reg ack;

	// Outputs
	wire req;
	wire [41:0] display;
	wire isWatch;
	wire isAlarm;
	wire isStop;
	wire isAPmode;
	wire isSETmode;
	wire isAlarmSet;

	// Instantiate the Unit Under Test (UUT)
	ProgrammableWatch uut (
		.clk_50MHz(clk_50MHz), 
		.instruction(instruction), 
		.ack(ack), 
		.req(req), 
		.display(display), 
		.isWatch(isWatch), 
		.isAlarm(isAlarm), 
		.isStop(isStop), 
		.isAPmode(isAPmode), 
		.isSETmode(isSETmode), 
		.isAlarmSet(isAlarmSet)
	);

	initial begin
		// Initialize Inputs
		clk_50MHz = 0;
		instruction = 0;
		ack = 0;
		#50;
		
		#15; 
		instruction = 3'b011;
		#5; 
		ack = 1;
		#100;
		ack = 0;
		#15; 
		instruction = 3'b100;
		#5; 
		ack = 1;
		#100;
		ack = 0;
		#15; 
		instruction = 3'b101;
		#5; 
		ack = 1;
		#100;
		ack = 0;
		#15; 
		instruction = 3'b110;
		#5; 
		ack = 1;
		#100;
		ack = 0;

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
	
	always begin
		#10; clk_50MHz = 1;
		#10; clk_50MHz = 0;
	end      
endmodule

