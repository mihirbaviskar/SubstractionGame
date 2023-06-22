`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:33:16 03/14/2023 
// Design Name: 
// Module Name:    seven_segment 
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

module seven_segment(
   clk_fst,
   clk_blk,
   sw_add, 
   sw_sub,
   win, 
   plr_turn, 
   pile_size,
   max_sub, 
   max_add,
   hide,
   seg,
   an
);
	
  input clk_fst;
  input clk_blk;
  input sw_add;
  input sw_sub;
  input win;
  input plr_turn;
  input [6:0] pile_size;
  input [2:0] max_sub;
  input [2:0] max_add;
  input hide;
  output reg [7:0] seg;
  output reg [3:0] an ;

  reg [3:0] digit0;
  reg [3:0] digit1;
  reg [3:0] digit2;
  reg [3:0] digit3;
  reg [3:0] currDig;
  
  initial begin
    digit0 = pile_size % 10;
    digit1 = pile_size / 10;
    digit2 = plr_turn + 11; // (+11) for decimal point
    digit3 = 13; // letter 'P'
  end
  
  always @(*) begin
    if (sw_add == 1 && sw_sub == 0) begin
      digit0 = max_add;
      digit1 = 0;
    end
    else if (sw_add == 0 && sw_sub == 1) begin
      digit0 = max_sub;
      digit1 = 0;
    end
    else if (hide == 1) begin
      digit0 = 14;
      digit1 = 14;
    end
    else begin
      digit0 = pile_size % 10;
		digit1 = pile_size / 10;
    end
  end
  
  
  integer i = 0;
  
  always @(posedge clk_fst) begin
    // blink P#00 if game ends
    if (win == 1) begin
      // first digit
      if ((i % 4 == 0)) begin
        an = 4'b1110;
        currDig = (clk_blk == 0) ? pile_size % 10 : 14;
      end
      // second digit
      if ((i % 4 == 1)) begin
        an = 4'b1101;
        currDig = (clk_blk == 0) ? pile_size / 10 : 14;
      end
      // third digit
      if ((i % 4 == 2)) begin
        an = 4'b1011;
        currDig = (clk_blk == 0) ? (plr_turn + 11) : 14; // (+10) for decimal point
      end
      // fourth digit
      if ((i % 4 == 3)) begin
        an = 4'b0111;
        currDig = (clk_blk == 0) ? 13 : 14;
      end
      i = i+1;
    end
    
    // display (player turn / max ADD / max SUB) + (pile size)
    if (win == 0) begin
      // first digit
      if ((i % 4 == 0)) begin
        an = 4'b1110;
        currDig = digit0;
      end
      // second digit
      if ((i % 4 == 1)) begin
        an = 4'b1101;
        currDig = digit1;
      end
      // third digit
      if ((i % 4 == 2)) begin
        an = 4'b1011;
        currDig = digit2;
      end
      // fourth digit
      if ((i % 4 == 3)) begin
        an = 4'b0111;
        currDig = digit3;
      end
      i = i+1;
    end
  end
  
  // change currDig to binary for seven-segment display
  always @(currDig) begin
    case (currDig)
      0 : seg = 8'b11000000; // 0 without decimal point
      1 : seg = 8'b11111001; // 1 without decimal point
      2 : seg = 8'b10100100; // 2 without decimal point
      3 : seg = 8'b10110000; // 3 without decimal point
      4 : seg = 8'b10011001; // 4 without decimal point
      5 : seg = 8'b10010010; // 5 without decimal point
      6 : seg = 8'b10000010; // 6 without decimal point
      7 : seg = 8'b11111000; // 7 without decimal point
      8 : seg = 8'b10000000; // 8 without decimal point
      9 : seg = 8'b10010000; // 9 without decimal point
      11: seg = 8'b01111001; // 1 with decimal point
      12: seg = 8'b00100100; // 2 with decimal point
      13: seg = 8'b10001100; // letter 'P'
      default : seg = 8'b11111111; // blank
    endcase
  end
endmodule

