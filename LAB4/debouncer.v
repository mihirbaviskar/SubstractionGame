`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:18:59 03/07/2023 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
	
	//INPUTS
	sw,
	btns,
	btnu,
	btnl,
	btnd,
	btnr,
	clk_fst,
	
	//OUTPUTS
	sw_sub,
	sw_add,
	sw_one,
	sw_two,
	sw_three,
	sw_four,
	sw_five,
	btn_rst,
	btn_sub,
	btn_sub_h,
	btn_add,
	btn_add_h

	);

	//INPUTS
	input [7:0] sw;
	input btns;
	input btnu;
	input btnl;
	input btnd;
	input btnr;
	input clk_fst;
	
	//OUTPUTS
	output reg sw_sub;
	output reg sw_add;
	output reg sw_one;
	output reg sw_two;
	output reg sw_three;
	output reg sw_four;
	output reg sw_five;
	output reg btn_rst;
	output reg btn_sub;
	output reg btn_sub_h;
	output reg btn_add;
	output reg btn_add_h;

	initial begin
		
		//OUTPUTS
		sw_sub = 0;
		sw_add = 0;
		sw_one = 0;
		sw_two = 0;
		sw_three = 0;
		sw_four = 0;
		sw_five = 0;
		btn_rst = 0;
		btn_sub = 0;
		btn_sub_h = 0;
		btn_add = 0;
		btn_add_h = 0;
	
	end
	
	always @(posedge clk_fst) begin
		
		if (sw[7] == 0) begin
			sw_sub = 0;
		end
		else begin
			sw_sub = 1;
		end
		
		if (sw[6] == 0) begin
			sw_add = 0;
		end
		else begin
			sw_add = 1;
		end
		
		if (sw[0] == 0) begin
			sw_one = 0;
		end
		else begin
			sw_one = 1;
		end
		
		if (sw[1] == 0) begin
			sw_two = 0;
		end
		else begin
			sw_two = 1;
		end
		
		if (sw[2] == 0) begin
			sw_three = 0;
		end
		else begin
			sw_three = 1;
		end
		
		if (sw[3] == 0) begin
			sw_four = 0;
		end
		else begin
			sw_four = 1;
		end
		
		if (sw[4] == 0) begin
			sw_five = 0;
		end
		else begin
			sw_five = 1;
		end
		
		if (btns == 0) begin
			btn_rst = 0;
		end
		else begin
			btn_rst = 1;
		end
		
		if (btnu == 0) begin
			btn_sub = 0;
		end
		else begin
			btn_sub = 1;
		end
		
		if (btnr == 0) begin
			btn_sub_h = 0;
		end
		else begin
			btn_sub_h = 1;
		end
		
		if (btnd == 0) begin
			btn_add = 0;
		end
		else begin
			btn_add = 1;
		end
		
		if (btnl == 0) begin
			btn_add_h = 0;
		end
		else begin
			btn_add_h = 1;
		end

	end
endmodule
