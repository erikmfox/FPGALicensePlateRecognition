`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 18:49:27
// Design Name: 
// Module Name: binaryzation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module binaryzation(
input clk,
input [11:0] pixel_gray,
output [11:0] pixel_binary
    );
    reg [11:0] pixel;
    always @ (posedge clk) begin
    if (pixel_gray < 12'b0101_0101_0101)
       
        pixel <= 12'b0000_0000_0000;
        else
        pixel <= 12'b1111_1111_1111;
        end
    
   assign pixel_binary = pixel; 
    
    
    
    
    
endmodule
