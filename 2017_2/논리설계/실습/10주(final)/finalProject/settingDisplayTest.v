`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:24:14 12/05/2017
// Design Name:   settingDisplay
// Module Name:   /csehome/qja0950/finalProject/settingDisplayTest.v
// Project Name:  finalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: settingDisplay
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module settingDisplayTest;

	// Inputs
	reg clk_50MHz;
	reg reset;
	reg isAPmode;
	reg p_set;
	reg p_op1;
	reg p_op2;
	reg p_free;

	// Outputs
	wire [6:0] loadH;
	wire [6:0] loadM;
	wire [6:0] loadS;
	wire load;
	wire [41:0] display;

	// Instantiate the Unit Under Test (UUT)
	settingDisplay uut (
		.clk_50MHz(clk_50MHz), 
		.reset(reset), 
		.isAPmode(isAPmode), 
		.p_set(p_set), 
		.p_op1(p_op1), 
		.p_op2(p_op2), 
		.p_free(p_free), 
		.loadH(loadH), 
		.loadM(loadM), 
		.loadS(loadS), 
		.load(load), 
		.display(display)
	);

	initial begin
		// Initialize Inputs
		clk_50MHz = 0;
		reset = 0;
		isAPmode = 0;
		p_set = 0;
		p_op1 = 0;
		p_op2 = 0;
		p_free = 0;
		
		#15;
		p_op1 = 1;
		#15;
		p_op1 = 0;
		#15;
		p_op1 = 1;
		#15;
		p_op1 = 0;
		#15;
		p_op1 = 1;
		#15;
		p_op1 = 0;
		#15;
		p_op1 = 1;
		#15;
		p_op1 = 0;
		#15;
		p_op1 = 1;
		#15;
		p_op1 = 0;
		
		
		#15;
		p_set = 1;
		#15;
		p_set = 0;
		
		
		
		#15;
		p_op2 = 1;
		#15;
		p_op2 = 0;
		#15;
		p_op2 = 1;
		#15;
		p_op2 = 0;
		#15;
		p_op2 = 1;
		#15;
		p_op2 = 0;
		#15;
		p_op2 = 1;
		#15;
		p_op2 = 0;
		
		
		#15;
		p_set = 1;
		#15;
		p_set = 0;
        
		// Add stimulus here

	end
	
	always begin
		#10; clk_50MHz = 1;
		#10; clk_50MHz = 0;
	end
      
endmodule

