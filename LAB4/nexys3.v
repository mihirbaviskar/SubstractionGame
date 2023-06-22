`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:36:12 03/07/2023 
// Design Name: 
// Module Name:    nexys3 
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
module nexys3(
	
	//INPUTS
	sw,
	btns,
	btnu,
	btnl,
	btnd,
	btnr,
	clk,
	
	//OUTPUTS
	seg,
	an
	
);

//INPUTS
input [7:0] sw;
input btns;
input btnu;
input btnl;
input btnd;
input btnr;
input clk;
	
//OUTPUTS
output wire [7:0] seg;
output wire [3:0] an;
	
//WIRES
wire clk_fst;
wire clk_blk;
wire clk_slow;
wire sw_sub;
wire sw_add;
wire sw_one;
wire sw_two;
wire sw_three;
wire sw_four;
wire sw_five;
wire btn_rst;
wire btn_sub;
wire btn_sub_h;
wire btn_add;
wire btn_add_h;
wire plr_turn;
wire [6:0] pile_size;
wire [2:0] max_sub;
wire [2:0] max_add;
wire hide;
wire win;
wire [13:0] rand;

clock clock_ (
		
	//INPUTS
	.clk(clk),
	
	//OUTPUTS
	.clk_fst(clk_fst),
	.clk_blk(clk_blk),
	.clk_slow(clk_slow)

);

debouncer debouncer_ (
	
	//INPUTS
	.sw(sw),
	.btns(btns),
	.btnu(btnu),
	.btnl(btnl),
	.btnd(btnd),
	.btnr(btnr),
	.clk_fst(clk_fst),
	
	//OUTPUTS
	.sw_sub(sw_sub),
	.sw_add(sw_add),
	.sw_one(sw_one),
	.sw_two(sw_two),
	.sw_three(sw_three),
	.sw_four(sw_four),
	.sw_five(sw_five),
	.btn_rst(btn_rst),
	.btn_sub(btn_sub),
	.btn_sub_h(btn_sub_h),
	.btn_add(btn_add),
	.btn_add_h(btn_add_h)
	
);

random random_ (
	.clk_slow(clk_slow),
	.rand(rand)
);

game game_ (
	
	//INPUTS
	.clk_slow(clk_slow),
	.btn_rst(btn_rst),
	.btn_sub(btn_sub),
	.btn_sub_h(btn_sub_h),
	.btn_add(btn_add),
	.btn_add_h(btn_add_h),
	.sw_one(sw_one),
	.sw_two(sw_two),
	.sw_three(sw_three),
	.sw_four(sw_four),
	.sw_five(sw_five),
	.rand(rand),
	
	//OUTPUTS
	.plr_turn(plr_turn),
	.pile_size(pile_size),
	.max_sub(max_sub),
	.max_add(max_add),
	.hide(hide),
	.win(win)

);

seven_segment seven_segment_ (
	
	//INPUTS
	.clk_fst(clk_fst),
	.clk_blk(clk_blk),
	.sw_add(sw_add),
	.sw_sub(sw_sub),
	.plr_turn(plr_turn),
	.pile_size(pile_size),
	.max_sub(max_sub),
	.max_add(max_add),
	.hide(hide),
	.win(win),

	//OUTPUTS
	.seg(seg),
	.an(an)

);

endmodule
