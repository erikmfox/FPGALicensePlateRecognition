module ram_top(
input clk,
input in_pixel,
input reset,
output reg [35:0] pixel_o,
output reg [35:0] pixel_rom


);

wire [15:0] in_addr1;
wire [15:0] in_addr2;
wire [15:0] in_addr3;
wire [15:0] in_addr4;
wire [15:0] in_addr5;
wire [15:0] in_addr6;
wire [15:0] in_addr7;
wire [15:0] in_addr8;
wire [15:0] in_addr9;
wire [15:0] in_addr10;
wire [15:0] in_addr11;
wire [15:0] in_addr12;
wire [15:0] in_addr13;
wire [15:0] in_addr14;
wire [15:0] in_addr15;
wire [15:0] in_addr16;

wire [15:0] out_addr1;
wire [15:0] out_addr2;
wire [15:0] out_addr3;
wire [15:0] out_addr4;
wire [15:0] out_addr5;
wire [15:0] out_addr6;
wire [15:0] out_addr7;
wire [15:0] out_addr8;
wire [15:0] out_addr9;
wire [15:0] out_addr10;
wire [15:0] out_addr11;
wire [15:0] out_addr12;
wire [15:0] out_addr13;
wire [15:0] out_addr14;
wire [15:0] out_addr15;
wire [15:0] out_addr16;


wire we1;
wire we2;
wire we3;
wire we4;
wire we5;
wire we6;
wire we7;
wire we8;
wire we9;
wire we10;
wire we11;
wire we12;
wire we13;
wire we14;
wire we15;
wire we16;

wire [1:0] test;
wire reset_r;

wire pixel0;
wire pixel1;
wire pixel2;
wire pixel3;
wire pixel4;
wire pixel5;
wire pixel6;
wire pixel7;
wire pixel8;
wire pixel9;
wire pixel10;
wire pixel11;
wire pixel12;
wire pixel13;
wire pixel14;
wire pixel15;
wire [15:0] we_flag;

wire pixel_ROM0;
wire pixel_ROM1;
wire pixel_ROM2;
wire pixel_ROM3;
wire pixel_ROM4;
wire pixel_ROM5;
wire pixel_ROM6;
wire pixel_ROM7;
wire pixel_ROM8;
wire pixel_ROM9;
wire pixel_ROM10;
wire pixel_ROM11;
wire pixel_ROM12;
wire pixel_ROM13;
wire pixel_ROM14;
wire pixel_ROM15;

assign reset_r = ~reset;

always @(*)
case(we_flag)
	16'b0000000000000001: pixel_o = {36{pixel0}};
	16'b0000000000000010: pixel_o = {36{pixel1}};
	16'b0000000000000100: pixel_o = {36{pixel2}};
	16'b0000000000001000: pixel_o = {36{pixel3}};
	16'b0000000000010000: pixel_o = {36{pixel4}};
	16'b0000000000100000: pixel_o = {36{pixel5}};
	16'b0000000001000000: pixel_o = {36{pixel6}};
	16'b0000000010000000: pixel_o = {36{pixel7}};
	16'b0000000100000000: pixel_o = {36{pixel8}};
	16'b0000001000000000: pixel_o = {36{pixel9}};
	16'b0000010000000000: pixel_o = {36{pixel10}};
	16'b0000100000000000: pixel_o = {36{pixel11}};
	16'b0001000000000000: pixel_o = {36{pixel12}};
	16'b0010000000000000: pixel_o = {36{pixel13}};
	16'b0100000000000000: pixel_o = {36{pixel14}};
	16'b1000000000000000: pixel_o = {36{pixel15}};
endcase
/*
always @(*)
case(we_flag)
	16'b0000000000000001: pixel_rom = {36{pixel_ROM0}};
	16'b0000000000000010: pixel_rom = {36{pixel_ROM1}};
	16'b0000000000000100: pixel_rom = {36{pixel_ROM2}};
	16'b0000000000001000: pixel_rom = {36{pixel_ROM3}};
	16'b0000000000010000: pixel_rom = {36{pixel_ROM4}};
	16'b0000000000100000: pixel_rom = {36{pixel_ROM5}};
	16'b0000000001000000: pixel_rom = {36{pixel_ROM6}};
	16'b0000000010000000: pixel_rom = {36{pixel_ROM7}};
	16'b0000000100000000: pixel_rom = {36{pixel_ROM8}};
	16'b0000001000000000: pixel_rom = {36{pixel_ROM9}};
	16'b0000010000000000: pixel_rom = {36{pixel_ROM10}};
	16'b0000100000000000: pixel_rom = {36{pixel_ROM11}};
	16'b0001000000000000: pixel_rom = {36{pixel_ROM12}};
	16'b0010000000000000: pixel_rom = {36{pixel_ROM13}};
	16'b0100000000000000: pixel_rom = {36{pixel_ROM14}};
	16'b1000000000000000: pixel_rom = {36{pixel_ROM15}};
endcase
*/
addr_control t1(
.clk(clk),
.rst(reset),
.in_addr1(in_addr1),
.in_addr2(in_addr2),
.in_addr3(in_addr3),
.in_addr4(in_addr4),
.in_addr5(in_addr5),
.in_addr6(in_addr6),
.in_addr7(in_addr7),
.in_addr8(in_addr8),
.in_addr9(in_addr9),
.in_addr10(in_addr10),
.in_addr11(in_addr11),
.in_addr12(in_addr12),
.in_addr13(in_addr13),
.in_addr14(in_addr14),
.in_addr15(in_addr15),
.in_addr16(in_addr16),
.out_addr1(out_addr1),
.out_addr2(out_addr2),
.out_addr3(out_addr3),
.out_addr4(out_addr4),
.out_addr5(out_addr5),
.out_addr6(out_addr6),
.out_addr7(out_addr7),
.out_addr8(out_addr8),
.out_addr9(out_addr9),
.out_addr10(out_addr10),
.out_addr11(out_addr11),
.out_addr12(out_addr12),
.out_addr13(out_addr13),
.out_addr14(out_addr14),
.out_addr15(out_addr15),
.out_addr16(out_addr16),

.we1(we1),
.we2(we2),
.we3(we3),
.we4(we4),
.we5(we5),
.we6(we6),
.we7(we7),
.we8(we8),
.we9(we9),
.we10(we10),
.we11(we11),
.we12(we12),
.we13(we13),
.we14(we14),
.we15(we15),
.we16(we16),
.we(we_flag)
//.we_disp(we_flag)
);

ram_t _inst (
.ram_t10_Data(in_pixel), 
.ram_t10_Q(pixel10), 
.ram_t10_RdAddress(out_addr11), 
.ram_t10_WrAddress(in_addr11), 
.ram_t10_RdClock(clk), 
.ram_t10_RdClockEn(1'b1), 
.ram_t10_Reset(reset_r), 
.ram_t10_WE(we11), 
.ram_t10_WrClock(clk), 
.ram_t10_WrClockEn(1'b1), 
.ram_t11_Data(in_pixel), 
.ram_t11_Q(pixel11), 
.ram_t11_RdAddress(out_addr12), 
.ram_t11_WrAddress(in_addr12), 
.ram_t11_RdClock(clk), 
.ram_t11_RdClockEn(1'b1), 
.ram_t11_Reset(reset_r), 
.ram_t11_WE(we12), 
.ram_t11_WrClock(clk), 
.ram_t11_WrClockEn(1'b1), 
.ram_t1_Data(in_pixel), 
.ram_t1_Q(pixel1), 
.ram_t1_RdAddress(out_addr2), 
.ram_t1_WrAddress(in_addr2), 
.ram_t1_RdClock(clk), 
.ram_t1_RdClockEn(1'b1), 
.ram_t1_Reset(reset_r), 
.ram_t1_WE(we2), 
.ram_t1_WrClock(clk), 
.ram_t1_WrClockEn(1'b1), 
.ram_t8_Data(in_pixel), 
.ram_t8_Q(pixel8), 
.ram_t8_RdAddress(out_addr9), 
.ram_t8_WrAddress(in_addr9), 
.ram_t8_RdClock(clk), 
.ram_t8_RdClockEn(1'b1), 
.ram_t8_Reset(reset_r), 
.ram_t8_WE(we9), 
.ram_t8_WrClock(clk), 
.ram_t8_WrClockEn(1'b1), 
.ram_t4_Data(in_pixel), 
.ram_t4_Q(pixel4), 
.ram_t4_RdAddress(out_addr5), 
.ram_t4_WrAddress(in_addr5), 
.ram_t4_RdClock(clk), 
.ram_t4_RdClockEn(1'b1), 
.ram_t4_Reset(reset_r), 
.ram_t4_WE(we5), 
.ram_t4_WrClock(clk), 
.ram_t4_WrClockEn(1'b1), 
.ram_t12_Data(in_pixel), 
.ram_t12_Q(pixel12), 
.ram_t12_RdAddress(out_addr13), 
.ram_t12_WrAddress(in_addr13), 
.ram_t12_RdClock(clk), 
.ram_t12_RdClockEn(1'b1), 
.ram_t12_Reset(reset_r), 
.ram_t12_WE(we13), 
.ram_t12_WrClock(clk), 
.ram_t12_WrClockEn(1'b1), 
.ram_t7_Data(in_pixel), 
.ram_t7_Q(pixel7), 
.ram_t7_RdAddress(out_addr8), 
.ram_t7_WrAddress(in_addr8), 
.ram_t7_RdClock(clk), 
.ram_t7_RdClockEn(1'b1), 
.ram_t7_Reset(reset_r), 
.ram_t7_WE(we8), 
.ram_t7_WrClock(clk), 
.ram_t7_WrClockEn(1'b1), 
.ram_t2_Data(in_pixel), 
.ram_t2_Q(pixel2), 
.ram_t2_RdAddress(out_addr3), 
.ram_t2_WrAddress(in_addr3), 
.ram_t2_RdClock(clk), 
.ram_t2_RdClockEn(1'b1), 
.ram_t2_Reset(reset_r), 
.ram_t2_WE(we3), 
.ram_t2_WrClock(clk), 
.ram_t2_WrClockEn(1'b1), 
.ram_t6_Data(in_pixel), 
.ram_t6_Q(pixel6), 
.ram_t6_RdAddress(out_addr7), 
.ram_t6_WrAddress(in_addr7), 
.ram_t6_RdClock(clk), 
.ram_t6_RdClockEn(1'b1), 
.ram_t6_Reset(reset_r), 
.ram_t6_WE(we7), 
.ram_t6_WrClock(clk), 
.ram_t6_WrClockEn(1'b1), 
.ram_t9_Data(in_pixel), 
.ram_t9_Q(pixel9), 
.ram_t9_RdAddress(out_addr10), 
.ram_t9_WrAddress(in_addr10), 
.ram_t9_RdClock(clk), 
.ram_t9_RdClockEn(1'b1), 
.ram_t9_Reset(reset_r), 
.ram_t9_WE(we10), 
.ram_t9_WrClock(clk), 
.ram_t9_WrClockEn(1'b1), 
.ram_t14_Data(in_pixel), 
.ram_t14_Q(pixel14), 
.ram_t14_RdAddress(out_addr15), 
.ram_t14_WrAddress(in_addr15), 
.ram_t14_RdClock(clk), 
.ram_t14_RdClockEn(1'b1), 
.ram_t14_Reset(reset_r), 
.ram_t14_WE(we15), 
.ram_t14_WrClock(clk), 
.ram_t14_WrClockEn(1'b1), 
.ram_t13_Data(in_pixel), 
.ram_t13_Q(pixel13), 
.ram_t13_RdAddress(out_addr14), 
.ram_t13_WrAddress(in_addr14), 
.ram_t13_RdClock(clk), 
.ram_t13_RdClockEn(1'b1), 
.ram_t13_Reset(reset_r), 
.ram_t13_WE(we14), 
.ram_t13_WrClock(clk), 
.ram_t13_WrClockEn(1'b1), 
.ram_t15_Data(in_pixel), 
.ram_t15_Q(pixel15), 
.ram_t15_RdAddress(out_addr16), 
.ram_t15_WrAddress(in_addr16), 
.ram_t15_RdClock(clk), 
.ram_t15_RdClockEn(1'b1), 
.ram_t15_Reset(reset_r), 
.ram_t15_WE(we16), 
.ram_t15_WrClock(clk), 
.ram_t15_WrClockEn(1'b1), 
.ram_t5_Data(in_pixel), 
.ram_t5_Q(pixel5), 
.ram_t5_RdAddress(out_addr6), 
.ram_t5_WrAddress(in_addr6), 
.ram_t5_RdClock(clk), 
.ram_t5_RdClockEn(1'b1), 
.ram_t5_Reset(reset_r), 
.ram_t5_WE(we6), 
.ram_t5_WrClock(clk), 
.ram_t5_WrClockEn(1'b1), 
.ram_t3_Data(in_pixel), 
.ram_t3_Q(pixel3), 
.ram_t3_RdAddress(out_addr4), 
.ram_t3_WrAddress(in_addr4), 
.ram_t3_RdClock(clk), 
.ram_t3_RdClockEn(1'b1), 
.ram_t3_Reset(reset_r), 
.ram_t3_WE(we4), 
.ram_t3_WrClock(clk), 
.ram_t3_WrClockEn(1'b1), 
.ram_test_Data(in_pixel), 
.ram_test_Q(pixel0), 
.ram_test_RdAddress(out_addr1), 
.ram_test_WrAddress(in_addr1), 
.ram_test_RdClock(clk), 
.ram_test_RdClockEn(1'b1), 
.ram_test_Reset(reset_r), 
.ram_test_WE(we1), 
.ram_test_WrClock(clk), 
.ram_test_WrClockEn(1'b1)
);


ROM ROM(
.ROM_3_Address(out_addr3), 
.ROM_3_Q(pixel_ROM3), 
.ROM_3_OutClock(clk), 
.ROM_3_OutClockEn(we3), 
.ROM_3_Reset(reset_r), 
.ROM_4_Address(out_addr4), 
.ROM_4_Q(pixel_ROM4), 
.ROM_4_OutClock(clk), 
.ROM_4_OutClockEn(we4), 
.ROM_4_Reset(reset_r), 
.ROM_5_Address(out_addr5), 
.ROM_5_Q(pixel_ROM5), 
.ROM_5_OutClock(clk), 
.ROM_5_OutClockEn(we5), 
.ROM_5_Reset(reset_r), 
.ROM_6_Address(out_addr6), 
.ROM_6_Q(pixel_ROM6), 
.ROM_6_OutClock(clk), 
.ROM_6_OutClockEn(we6), 
.ROM_6_Reset(reset_r), 
.ROM_8_Address(out_addr8), 
.ROM_8_Q(pixel_ROM8), 
.ROM_8_OutClock(clk), 
.ROM_8_OutClockEn(we8), 
.ROM_8_Reset(reset_r), 
.ROM_9_Address(out_addr9), 
.ROM_9_Q(pixel_ROM9), 
.ROM_9_OutClock(clk), 
.ROM_9_OutClockEn(we9), 
.ROM_9_Reset(reset_r), 
.ROM_10_Address(out_addr10), 
.ROM_10_Q(pixel_ROM10), 
.ROM_10_OutClock(clk), 
.ROM_10_OutClockEn(we10), 
.ROM_10_Reset(reset_r), 
.ROM_7_Address(out_addr7), 
.ROM_7_Q(pixel_ROM7), 
.ROM_7_OutClock(clk), 
.ROM_7_OutClockEn(we7), 
.ROM_7_Reset(reset_r), 
.ROM_14_Address(out_addr14), 
.ROM_14_Q(pixel_ROM14), 
.ROM_14_OutClock(clk), 
.ROM_14_OutClockEn(we14), 
.ROM_14_Reset(reset_r), 
.ROM_11_Address(out_addr11), 
.ROM_11_Q(pixel_ROM11), 
.ROM_11_OutClock(clk), 
.ROM_11_OutClockEn(we11), 
.ROM_11_Reset(reset_r), 
.ROM_15_Address(out_addr15), 
.ROM_15_Q(pixel_ROM15), 
.ROM_15_OutClock(clk), 
.ROM_15_OutClockEn(we15), 
.ROM_15_Reset(reset_r), 
.ROM_1_Address(out_addr1), 
.ROM_1_Q(pixel_ROM1), 
.ROM_1_OutClock(clk), 
.ROM_1_OutClockEn(we1), 
.ROM_1_Reset(reset_r), 
.ROM_12_Address(out_addr12), 
.ROM_12_Q(pixel_ROM12), 
.ROM_12_OutClock(clk), 
.ROM_12_OutClockEn(we12), 
.ROM_12_Reset(reset_r), 
.ROM_13_Address(out_addr13), 
.ROM_13_Q(pixel_ROM13), 
.ROM_13_OutClock(clk), 
.ROM_13_OutClockEn(we13), 
.ROM_13_Reset(reset_r), 
.ROM_16_Address(out_addr16), 
.ROM_16_Q(pixel_ROM16), 
.ROM_16_OutClock(clk), 
.ROM_16_OutClockEn(we16), 
.ROM_16_Reset(reset_r), 
.ROM_2_Address(out_addr2), 
.ROM_2_Q(pixel_ROM2), 
.ROM_2_OutClock(clk), 
.ROM_2_OutClockEn(we2), 
.ROM_2_Reset(reset_r)
);


endmodule
