module addr_control 
(
input clk,
input rst,

output [15:0] in_addr1,
output [15:0] in_addr2,
output [15:0] in_addr3,
output [15:0] in_addr4,
output [15:0] in_addr5,
output [15:0] in_addr6,
output [15:0] in_addr7,
output [15:0] in_addr8,
output [15:0] in_addr9,
output [15:0] in_addr10,
output [15:0] in_addr11,
output [15:0] in_addr12,
output [15:0] in_addr13,
output [15:0] in_addr14,
output [15:0] in_addr15,
output [15:0] in_addr16,

output [15:0] out_addr1,
output [15:0] out_addr2,
output [15:0] out_addr3,
output [15:0] out_addr4,
output [15:0] out_addr5,
output [15:0] out_addr6,
output [15:0] out_addr7,
output [15:0] out_addr8,
output [15:0] out_addr9,
output [15:0] out_addr10,
output [15:0] out_addr11,
output [15:0] out_addr12,
output [15:0] out_addr13,
output [15:0] out_addr14,
output [15:0] out_addr15,
output [15:0] out_addr16,

output we1,
output we2,
output we3,
output we4,
output we5,
output we6,
output we7,
output we8,
output we9,
output we10,
output we11,
output we12,
output we13,
output we14,
output we15,
output we16,
output [15:0] we
);


reg [19:0] hcounter = {20{1'b0}}; 

reg [15:0] in_address1;
reg [15:0] in_address2;
reg [15:0] in_address3;
reg [15:0] in_address4;
reg [15:0] in_address5;
reg [15:0] in_address6;
reg [15:0] in_address7;
reg [15:0] in_address8;
reg [15:0] in_address9;
reg [15:0] in_address10;
reg [15:0] in_address11;
reg [15:0] in_address12;
reg [15:0] in_address13;
reg [15:0] in_address14;
reg [15:0] in_address15;
reg [15:0] in_address16;

reg [15:0] out_address1;
reg [15:0] out_address2;
reg [15:0] out_address3;
reg [15:0] out_address4;
reg [15:0] out_address5;
reg [15:0] out_address6;
reg [15:0] out_address7;
reg [15:0] out_address8;
reg [15:0] out_address9;
reg [15:0] out_address10;
reg [15:0] out_address11;
reg [15:0] out_address12;
reg [15:0] out_address13;
reg [15:0] out_address14;
reg [15:0] out_address15;
reg [15:0] out_address16;


reg [15:0] wenable;

reg [1:0] delay = {2{1'b0}};


always @(posedge clk) begin
	if (rst) begin 
		hcounter <= 20'd0;
	
		in_address1 <= 16'd0;
		in_address2 <= 16'd0;
		in_address3 <= 16'd0;
		in_address4 <= 16'd0;
		in_address5 <= 16'd0;
		in_address6 <= 16'd0;
		in_address7 <= 16'd0;
		in_address8 <= 16'd0;
		in_address9 <= 16'd0;
		in_address10 <= 16'd0;	
		in_address11 <= 16'd0;
		in_address12 <= 16'd0;
		in_address13 <= 16'd0;
		in_address14 <= 16'd0;	
		in_address15 <= 16'd0;	
		in_address16 <= 16'd0;	

		out_address1 <= 16'd0;
		out_address2 <= 16'd0;
		out_address3 <= 16'd0;
		out_address4 <= 16'd0;
		out_address5 <= 16'd0;
		out_address6 <= 16'd0;
		out_address7 <= 16'd0;
		out_address8 <= 16'd0;
		out_address9 <= 16'd0;
		out_address10 <= 16'd0;	
		out_address11 <= 16'd0;
		out_address12 <= 16'd0;
		out_address13 <= 16'd0;
		out_address14 <= 16'd0;	
		out_address15 <= 16'd0;	
		out_address16 <= 16'd0;	

		wenable <= 16'd0;

		delay <= 2'd0;
	end

	if (hcounter == 20'd1036800)
		hcounter <= 20'd0;
	else
		hcounter <= hcounter + 1'd1;
	

	if (delay == 2'd1)
		delay <= 2'd1;
	else 
		delay <= delay + 1'd1;

	if (hcounter < 20'd65536) begin
		wenable <= 16'b0000_0000_0000_0001;
		in_address1 <= hcounter;
	end
	
	else if (hcounter >= 20'd65536 && hcounter < 20'd131072) begin
		wenable <= 16'b0000_0000_0000_0010;
		in_address2 <= hcounter - 20'd65536;
	end
	
	else if (hcounter >= 20'd131072 && hcounter < 20'd196608) begin
		wenable <= 16'b0000_0000_0000_0100;
		in_address3 <= hcounter - 20'd131072;
	end

	else if (hcounter >= 20'd196608 && hcounter < 20'd262144) begin
		wenable <= 16'b0000_0000_0000_1000;
		in_address4 <= hcounter - 20'd196608;
	end

	else if (hcounter >= 20'd262144 && hcounter < 20'd327680) begin
		wenable <= 16'b0000_0000_0001_0000;
		in_address5 <= hcounter - 20'd262144;
	end

	else if (hcounter >= 20'd327680 && hcounter < 20'd393216) begin
		wenable <= 16'b0000_0000_0010_0000;
		in_address6 <= hcounter - 20'd327680;
	end

	else if (hcounter >= 20'd393216 && hcounter < 20'd458752) begin
		wenable <= 16'b0000_0000_0100_0000;
		in_address7 <= hcounter - 20'd393216;
	end
	
	else if (hcounter >= 20'd458752 && hcounter < 20'd524288) begin
		wenable <= 16'b0000_0000_1000_0000;
		in_address8 <= hcounter - 20'd458752;
	end

	else if (hcounter >= 20'd524288 && hcounter < 20'd589824) begin
		wenable <= 16'b0000_0001_0000_0000;
		in_address9 <= hcounter - 20'd524288;
	end

	else if (hcounter >= 20'd589824 && hcounter < 20'd655360) begin
		wenable <= 16'b0000_0010_0000_0000;
		in_address10 <= hcounter - 20'd589824;
	end

	else if (hcounter >= 20'd655360 && hcounter < 20'd720896) begin
		wenable <= 16'b0000_0100_0000_0000;
		in_address11 <= hcounter - 20'd655360;
	end

	else if (hcounter >= 20'd720896 && hcounter < 20'd786432) begin
		wenable <= 16'b0000_1000_0000_0000;
		in_address12 <= hcounter - 20'd720896;
	end

	else if (hcounter >= 20'd786432 && hcounter < 20'd851968) begin
		wenable <= 16'b0001_0000_0000_0000;
		in_address13 <= hcounter - 20'd786432;
	end

	else if (hcounter >= 20'd851968 && hcounter < 20'd917504) begin
		wenable <= 16'b0010_0000_0000_0000;
		in_address14 <= hcounter - 20'd851968;
	end

	else if (hcounter >= 20'd917504 && hcounter < 20'd983040) begin
		wenable <= 16'b0100_0000_0000_0000;
		in_address15 <= hcounter - 20'd917504;
	end

	else if (hcounter >= 20'd983040 && hcounter < 20'd1036800) begin
		wenable <= 16'b1000_0000_0000_0000;
		in_address16 <= hcounter - 20'd983040;
	end



if (delay == 2'd1)begin
	out_address1 <= in_address1;
	out_address2 <= in_address2;	
	out_address3 <= in_address3;
	out_address4 <= in_address4;
	out_address5 <= in_address5;
	out_address6 <= in_address6;
	out_address7 <= in_address7;
	out_address8 <= in_address8;
	out_address9 <= in_address9;
	out_address10 <= in_address10;
	out_address11 <= in_address11;
	out_address12 <= in_address12;
	out_address13 <= in_address13;
	out_address14 <= in_address14;
	out_address15 <= in_address15;
	out_address16 <= in_address16;
end		
end

assign in_addr1 = in_address1;
assign in_addr2 = in_address2;
assign in_addr3 = in_address3;
assign in_addr4 = in_address4;
assign in_addr5 = in_address5;
assign in_addr6 = in_address6;
assign in_addr7 = in_address7;
assign in_addr8 = in_address8;
assign in_addr9 = in_address9;
assign in_addr10 = in_address10;
assign in_addr11 = in_address11;
assign in_addr12 = in_address12;
assign in_addr13 = in_address13;
assign in_addr14 = in_address14;
assign in_addr15 = in_address15;
assign in_addr16 = in_address16;

assign out_addr1 = out_address1;
assign out_addr2 = out_address2;
assign out_addr3 = out_address3;
assign out_addr4 = out_address4;
assign out_addr5 = out_address5;
assign out_addr6 = out_address6;
assign out_addr7 = out_address7;
assign out_addr8 = out_address8;
assign out_addr9 = out_address9;
assign out_addr10 = out_address10;
assign out_addr11 = out_address11;
assign out_addr12 = out_address12;
assign out_addr13 = out_address13;
assign out_addr14 = out_address14;
assign out_addr15 = out_address15;
assign out_addr16 = out_address16;


assign we1 = wenable[0];
assign we2 = wenable[1];
assign we3 = wenable[2];
assign we4 = wenable[3];
assign we5 = wenable[4];
assign we6 = wenable[5];
assign we7 = wenable[6];
assign we8 = wenable[7];
assign we9 = wenable[8];
assign we10 = wenable[9];
assign we11 = wenable[10];
assign we12 = wenable[11];
assign we13 = wenable[12];
assign we14 = wenable[13];
assign we15 = wenable[14];
assign we16 = wenable[15];

assign we = wenable;

endmodule
