

module Nexys4_FPGA_top(
    // On board connections
    input       clk,                // System Clock 100Mhz
    input       btnCpuReset,        // Input pushbutton-RESET BUTTOn
    input       sw1, 
    input       sw2,
    input       sw3,
    input       sw4,
    input       sw5,
    input       sw6,
    input       sw7,
    input       sw8,
    output       led1,
    output        led2,
        output       led3,
    output        led4,
        output       led5,
    output        led6,
    // VGA connections          
    output [3:0] vga_red,           // RGB-red              
    output [3:0] vga_green,         // RGB-green
    output [3:0] vga_blue,          // RGB-blue
    output       vga_hsync,         // VGA horizontal sync
    output       vga_vsync          // VGA vertial sync
);

    // internal variables
    wire clk50;                     // 50Mhz clock signal
    wire clk25;                     // 25Mhz clock signal
        
    wire db_btnCpuReset;            // Debounce signal of pushbutton - RESET BUTTON
    
//    wire resend;                    // Signal to re-configure OV7670
//    wire config_finished;           // Signal to indidate the configuration is finished
    wire we_RAM;
    wire addr_RAM;
    // RAM interface
    wire [15:0] frame_addr;         // address to read from memory
    wire [15:0] addr;
    wire [15:0] frame_pixel;        // data from reading a memory location
    wire [15:0] gray;
    wire ROM_enable;
    wire [15:0] pixel_pre;
    wire [11:0] pixel_post;
    wire [11:0] pixel_characters;
    wire [15:0] addr_characters;
    wire [14:0] addr_characters_1;
//    wire [17:0] capture_addr;       // address to write to memory
//    wire [11:0] capture_data;       // data to write into a memory location
//    wire        capture_we;         // Write enable signal to RAM
    
    // Internal singal assigments
//    assign LED          = config_finished;      // Flag if configuration is finished   
//    assign OV7670_XCLK  = clk25;                // Assign system clock for OV7670 (25Mhz according to OV7670 datasheet)
//    assign resend       = ~db_btnCpuReset;      // Assign reset signal
    
//=====================================================================================================================
//                                              Implementation
//=====================================================================================================================
    
    // Clock dividers to generate 50Mhz and 25Mhz clock signals
    Clock_divider clock_divider_1(
        .clk_in ( clk   ),          // 1-bit Input  100Mhz clock
        .clk_out( clk50 )           // 1-bit Output 50Mhz  clock --> to debounce, frame buffer and OV7670 controller
    );
        
    Clock_divider clock_divider_2(
        .clk_in ( clk50 ),          // 1-bit Input  50Mhz clock
        .clk_out( clk25 )           // 1-bit Output 25Mhz clock --> to VGA
    );
        
    // Debouncer for reset pushbutton
    debounce DB (
        .clk     ( clk            ),    // 100 Mhz clock
        .pbtn_in ( btnCpuReset    ),    // Raw signal from pushbutton
        .pbtn_db ( db_btnCpuReset )     // debounced signal
    );    

    
    blk_mem_gen_0 your_instance_name (
      .clka(clk25),    // input wire clka
      .ena(ROM_enable),      // input wire ena
      .addra(addr),  // input wire [15 : 0] addra
      .douta(pixel_pre)  // output wire [15 : 0] douta
    );
    
    track addr1(
        .clk        (clk25),
        .enable     (sw1),
        .ROM_addr   (addr),
        .we         (ROM_enable)
    );
    image_processing p1(
        .clk        (clk25),
        .rst        (db_btnCpuReset),
        .sw1        (sw1),
        .sw2        (sw2),
        .pixel_pre      (pixel_pre),
        .pixel_post     (pixel_post)
  //      .we_RAM        (we_RAM),
 //       .addr           (addr_RAM)
    );
    
RAM RAM_for_character (
      .clka(clk25),    // input wire clka
      .wea(1'b1),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [15 : 0] addra
      .dina(pixel_post),    // input wire [11 : 0] dina
      .clkb(clk25),    // input wire clkb
      .enb(1'b1),      // input wire enb
      .addrb(addr_characters),  // input wire [15 : 0] addrb
      .doutb(pixel_characters)  // output wire [11 : 0] doutb
    );
    
    
   addr_character addr_character(
    .clk(clk25),
   .RAM_addr(addr_characters)   
    );
    
     addr_character_1 addr_character_1(
     .clk(clk25),
    .RAM_addr_1(addr_characters_1)   
     );
       
RAM_CHARACTER RAM_CHARACTER (
      .clka(clk25),    // input wire clka
      .wea(1'b1),      // input wire [0 : 0] wea
      .addra(addr_characters_1),  // input wire [14 : 0] addra
      .dina(pixel_characters),    // input wire [11 : 0] dina
      .clkb(clk25),    // input wire clkb
      .enb(1'b1),      // input wire enb
      .addrb(frame_addr),  // input wire [14 : 0] addrb
      .doutb(frame_pixel)  // output wire [11 : 0] doutb
    );
    

    
    
    // VGA Controller

    VGA_Controller VGA(
        .enable_1     (    sw2         ),
        .enable_2       (sw3),
        .enable_3       (sw4),
        .enable_4       (sw5),
        .enable_5       (sw6),
        .enable_6       (sw7),
        .clk25      ( clk25       ),    // 1-bit  Input 25Mhz clock
        .vga_red    ( vga_red     ),    // 3-bit  Output to VGA red
        .vga_green  ( vga_green   ),    // 3-bit  Output to VGA green
        .vga_blue   ( vga_blue    ),    // 3-bit  Output to VGA blue
        .vga_hsync  ( vga_hsync   ),    // 1-bit  Output to VGA hsync
        .vga_vsync  ( vga_vsync   ),    // 1-bit  Output to VGA vsync
      .frame_addr ( frame_addr  ),    // 18-bit Output frame address  --> to frame buffer
        .frame_pixel(frame_pixel),     // 12-bit Input frame pixel     --> from frame buffer
        .leds_result({led6,led5,led4,led3,led2,led1})
  //      .wenable (ROM_enable)
    );
    
    
    
    
//wire result;    
//wire [15:0] pixel_database;
//     wire [11:0] addr_compare;
//     wire enable_ROM_database;
//      compare compare(
//        .clk (clk50),
//        .enable (sw2),
//        .pixel_processed (frame_pixel),
//        .result(result),
//        .enable_result(sw8),
//        .pixel_database(pixel_database)
//        );
//        image_P image_P (
//          .clka(clk25),    // input wire clka
//          .ena(enable_ROM_database),      // input wire ena
//          .addra(addr_compare),  // input wire [11 : 0] addra
//          .douta(pixel_database)  // output wire [15 : 0] douta
//        ); 
     
//    track_compare c(
//    .clk(clk25),
//    .ROM_addr(addr_compare),
//    .enable(sw8),
//    .enable_ROM(enable_ROM_database)
//    );
//      assign led1 = result;


endmodule
