`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:06:05 03/09/2023 
// Design Name: 
// Module Name:    clock 
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
module clock(

	//INPUTS
	clk,
	
	//OUTPUTS
	clk_fst,
	clk_blk,
	clk_slow
	
   );
	
	//INPUTS
	input clk;
	
	//OUTPUTS
	output reg clk_fst;
	output reg clk_blk;
	output reg clk_slow;
	
	//REGISTERS
	reg [25:0] counter_fst;
  	reg [25:0] counter_blk;
	reg [25:0] counter_slow;

	initial begin
		
		//OUTPUTS
		clk_fst = 0;
		clk_blk = 0;
		clk_slow = 0;
		
		//REGISTERS
		counter_fst = 0;
		counter_blk = 0;
		counter_slow = 0;
		
	end
	
	always @ (posedge clk) begin
	
		counter_fst = counter_fst + 1'b1;
      if (counter_fst == 100000-1) begin // 500Hz
			counter_fst = 0;
			clk_fst = ~clk_fst;
		end
		
		counter_slow = counter_slow + 1'b1;
		if (counter_slow == 5000000-1) begin
			counter_slow = 0;
			clk_slow = ~clk_slow;
		end
      	
      counter_blk = counter_blk + 1'b1;
      if (counter_blk == 40000000-1) begin // 4Hz
			counter_blk = 0;
			clk_blk = ~clk_blk;
		end
	
	end

endmodule
