`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/21 17:17:44
// Design Name: 
// Module Name: rgb2gray
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

module rgb2gray
(
input clk,
input [7:0]img_R,
input [7:0]img_G,
input [7:0]img_B,
output [23:0]gray,
output oenable
);
reg we;
reg [15:0] R1,R2,R3;
reg [15:0] G1,G2,G3;
reg [15:0] B1,B2,B3;

reg [15:0] img_Y_pre;
reg [15:0] img_Cb_pre;
reg [15:0] img_Cr_pre;

reg [7:0]  img_Y;
reg [7:0]  img_Cb;
reg [7:0]  img_Cr;

always @(posedge clk)
begin

	R1 <= img_R * 8'd77;
	G1 <= img_G * 8'd150;
	B1 <= img_B * 8'd29;
 
    R2 <= img_R * 8'd43; 
    G2 <= img_G * 8'd85; 
    B2 <= img_B * 8'd128; 

    R3 <= img_R * 8'd128;
    G3 <= img_G * 8'd107;
    B3 <= img_B * 8'd21;


end

always @(posedge clk )
begin

        img_Y_pre  <= R1 + G1 + B1;
        img_Cb_pre <= B2 - R2 - G2 + 16'd32768;
        img_Cr_pre <= R3 - G3 - B3 + 16'd32768;

    
end

always @(posedge clk)
begin

        img_Y  <= img_Y_pre  [15:8];
        img_Cb <= img_Cb_pre [15:8];
        img_Cr <= img_Cr_pre [15:8];
    if (img_Y != 8'b0)
        we <= 1'b1;

end 

assign gray = {img_Y[7:0],img_Y[7:0],img_Y[7:0]};
assign oenable = we;
endmodule
