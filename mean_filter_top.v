`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/02 16:56:44
// Design Name: 
// Module Name: mean_filter_top
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


module mean_filter_top(
input clk,
input rst,
input wenable,
input [11:0] pixel_pre,
output oenable,
output [11:0] pixel_post
    );
  wire we_1;
  wire we_2;  
  wire [35:0] pixel_row;
  wire [107:0] pixel_window;
    
RowsGenerator Rows(
        .clk(clk),
   //     .rst_n(rst),
        .in_enable(wenable),
        .in_data(pixel_pre),
        .out_ready(we_1),
        .out_data(pixel_row)
        );
    
 window window(
            .clk(clk),
   //         .rst_n(rst),
            .in_enable(we_1),
            .in_data(pixel_row),
            .out_ready(we_2),
            .out_data(pixel_window)
          //  .input_ack()
            );
            
     MeanFilter mf(
                .clk(clk), 
     //           .rst_n(rst), 
                .in_enable(we_2), 
                .in_data(pixel_window), 
                .out_ready(oenable), 
                .out_data(pixel_post)     
            );
endmodule
