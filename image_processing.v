`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/24 15:45:11
// Design Name: 
// Module Name: image_processing
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


module image_processing(
input clk,
input [15:0] pixel_pre,
input rst,
input sw1,
input sw2,
output [11:0] pixel_post,
output we_RAM,
output [7:0] addr 
    );
    wire [23:0] pixel_gray;
    reg we = 1'b0;
    wire [11:0] pixel_binary;
    wire enable_meanfilter;
    wire enable_fifo;
    reg [7:0] address = {8{1'b0}};
    
       rgb2gray r2g(
         .clk        ( clk ),
         .img_R      ({pixel_pre[15:11],pixel_pre[15:13]}),
         .img_G      ({pixel_pre[10:5],pixel_pre[10:9]}),
         .img_B      ({pixel_pre[4:0],pixel_pre[4:2]}),
         .gray       (pixel_gray),
         .oenable   (enable_fifo)
     );
     
//   mean_filter_top(
//     .clk(clk),
//     .rst(rst),
//     .wenable(enable_fifo),
//     .pixel_pre({pixel_gray[23:20],pixel_gray[15:12],pixel_gray[7:4]}),
//     .oenable(enable_meanfilter),
//     .pixel_post(pixel_post)
//         );
     
     
    binaryzation binary(
    .clk            (clk),
    .pixel_gray     ({pixel_gray[23:20],pixel_gray[15:12],pixel_gray[7:4]}),
    .pixel_binary   (pixel_binary)
    );
//    always @*
//    begin
//if(sw1) begin
//pixel_post = {pixel_pre[15:12],pixel_pre[10:7],pixel_pre[4:1]};
 // end
 // else if(sw2) begin
//pixel_post = pixel_binary;
//end 
//else begin
//pixel_post = 12'b0;
always @(posedge clk) begin
    if (pixel_binary == 12'b0 || pixel_binary == 12'b1) begin
        we <= 1'b1;
         address <= address + 1'b1;
        end

           
   end
  // end
  
 assign pixel_post = pixel_binary;
 assign addr = address;
 assign we_RAM = we;
endmodule
