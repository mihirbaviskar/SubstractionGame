`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:07:17 03/16/2023
// Design Name:   random
// Module Name:   C:/Users/Student/Desktop/23w_152a_L4G8/LAB4/random_tb.v
// Project Name:  LAB4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: random
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module random_tb;

	// Inputs
	reg clk_slow;

	// Outputs
	wire [13:0] rand;

	// Instantiate the Unit Under Test (UUT)
	random uut (
		.clk_slow(clk_slow), 
		.rand(rand)
	);

	initial begin
		// Initialize Inputs
		clk_slow = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
	always #5 clk_slow = ~clk_slow
	
endmodule

