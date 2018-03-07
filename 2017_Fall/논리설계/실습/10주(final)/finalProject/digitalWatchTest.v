`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:23:23 12/05/2017
// Design Name:   digitalWatch
// Module Name:   /csehome/qja0950/finalProject/digitalWatchTest.v
// Project Name:  finalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: digitalWatch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module digitalWatchTest;

	// Inputs
	reg clk_50MHz;
	reg u_mode;
	reg u_set;
	reg u_op1;
	reg u_op2;
	reg u_free;
	reg reset;

	// Outputs
	wire [41:0] display;
	wire isWatch;
	wire isAlarm;
	wire isStop;

	// Instantiate the Unit Under Test (UUT)
	digitalWatch uut (
		.clk_50MHz(clk_50MHz), 
		.u_mode(u_mode), 
		.u_set(u_set), 
		.u_op1(u_op1), 
		.u_op2(u_op2), 
		.u_free(u_free), 
		.reset(reset), 
		.display(display), 
		.isWatch(isWatch), 
		.isAlarm(isAlarm), 
		.isStop(isStop)
	);

	initial begin
		// Initialize Inputs
		clk_50MHz = 0;
		u_mode = 0;
		u_set = 0;
		u_op1 = 0;
		u_op2 = 0;
		u_free = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

