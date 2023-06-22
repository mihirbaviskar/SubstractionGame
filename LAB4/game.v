`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:57 03/14/2023 
// Design Name: 
// Module Name:    game 
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

module game(
	
//INPUTS
	clk_slow,
	btn_rst,
	btn_sub,
	btn_sub_h,
  	btn_add,
  	btn_add_h,
  	sw_one,
  	sw_two,
  	sw_three,
  	sw_four,
  	sw_five,
	rand,
	
//OUTPUTS
	win,
	plr_turn,
	pile_size,
	max_sub,
  	max_add,
  	hide
	
);
	
	//INPUTS
	input clk_slow;
	input btn_rst;
	input btn_sub;
	input btn_sub_h;
	input btn_add;
	input btn_add_h;
	input sw_one;
	input sw_two;
	input sw_three;
	input sw_four;
	input sw_five;
	input [13:0] rand;
	
	//OUTPUTS	
	output reg win;
	output reg plr_turn;
	output reg [6:0] pile_size;
	output reg [2:0] max_sub;
	output reg [2:0] max_add;
	output reg hide;

	//REGISTER
	reg [1:0] hide_mem;
	reg valid;
	reg [2:0] val;
	
	initial begin
		pile_size = rand % 50 + 50;
		max_sub = rand % 5;
		max_add = rand % 3;
		win = 0;
		plr_turn = 0;
		hide = 0;
		
		//REGISTERS
		hide_mem[0] = 0;
		hide_mem[1] = 0;
		valid = 0;
		val = 0;
	
	end
  
	always@(posedge clk_slow) begin
	
		if(btn_rst == 1) begin
			
			pile_size = rand%50 + 50;
			max_sub = rand % 5;
			max_add = rand % 3;
			win = 0;
			plr_turn = 0;
			hide = 0;
			hide_mem[0] = 0;
			hide_mem[1] = 0;
			
		end
		
		else begin
		
		if (btn_sub == 0 && btn_sub_h == 0 && btn_add == 0 && btn_add_h == 0) begin
			if((sw_one + sw_two + sw_three + sw_four + sw_five) == 1) begin
				valid = 1;
				case ({sw_one, sw_two, sw_three, sw_four, sw_five})
					5'b10000: val = 1; // if sw_one is high
					5'b01000: val = 2; // if sw_two is high
					5'b00100: val = 3; // if sw_three is high
					5'b00010: val = 4; // if sw_four is high
					5'b00001: val = 5; // if sw_five is high
					default:  val = 0; // default value
				endcase
			end
			
			else begin
				valid = 0;
			end
		end
		
		if (btn_sub == 1 && win == 0 && val <= max_sub && pile_size - val >= 0 && valid == 1) begin
			pile_size = pile_size - val;
			hide = 0;
			if (pile_size == 0) begin
				win = 1;
			end
			else begin					// otherwise go to next player
				plr_turn = ~plr_turn;
			end
		end
			
		else if (btn_sub_h == 1 && win == 0 && val <= max_sub && pile_size - val >= 0 && hide_mem[plr_turn] == 0 && valid == 1) begin
			pile_size = pile_size - val;
			hide = 1;
			hide_mem[plr_turn] = 1;
			if (pile_size == 0) begin
				win = 1;
			end
			else begin					// otherwise go to next player
				plr_turn = ~plr_turn;
			end
		end
			
		else if (btn_add == 1 && win == 0 && val <= max_add && pile_size + val <= 99 && valid == 1) begin
			pile_size = pile_size + val;
			hide = 0;
			plr_turn = ~plr_turn;
		end
			
		else if (btn_add_h == 1 && win == 0 && val <= max_add && pile_size + val <= 99 && hide_mem[plr_turn] == 0 && valid == 1) begin
			pile_size = pile_size + val;
			hide = 1;
			hide_mem[plr_turn] = 1;
			plr_turn = ~plr_turn;
		end
	end
end
    
endmodule

