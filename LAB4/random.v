`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:19 03/16/2023 
// Design Name: 
// Module Name:    random 
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
module random (
	clk_slow,
	rand 
);

input clk_slow;
output reg [13:0] rand;

integer prime2 = 1049;
integer prime3 = 2129;

initial begin
	rand = 1009;
end

always @ (posedge clk_slow) begin
	rand = (rand * prime2) % prime3;
end

endmodule
