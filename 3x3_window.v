

`timescale 1ns / 1ps

module window(
	clk,
//	rst_n,
	in_enable,
	in_data,
	out_ready,
	out_data,
	input_ack
	);


	parameter[0 : 0] work_mode = 0;

	parameter[3 : 0] window_width = 3;

	parameter[3: 0] color_width = 12;

	parameter[2 : 0] window_width_half = window_width >> 1;

	input clk;
	
//	input rst_n;

	input in_enable;

	input [color_width * window_width - 1 : 0] in_data;
	
	output out_ready;

	output[color_width * window_width * window_width - 1 : 0] out_data;

	output input_ack;

	reg[color_width * window_width - 1 : 0] reg_out_data[0 : window_width - 1];
	reg[3 : 0] con_init;


	genvar y;
	genvar x;
	generate
		if(work_mode == 0) begin
			assign input_ack = 0;
			reg reg_out_ready;
			assign out_ready = reg_out_ready;
			always @(posedge clk or negedge in_enable) begin
				if(~in_enable) begin
					con_init <= 0;
					reg_out_ready <= 0;
				end else if(con_init == window_width_half) begin
					con_init <= con_init;
					reg_out_ready <= 1;
				end else begin
					con_init <= con_init + 1;
					reg_out_ready <= 0;
				end
			end
			for (y = 0; y < window_width; y = y + 1) begin
				for (x = 0; x < window_width; x = x + 1) begin
					if (x == 0) begin 
						always @(posedge clk or negedge in_enable) begin
							if(~in_enable)
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= 0;
							else
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= in_data[(y + 1) * color_width - 1 : y * color_width];
						end
					end else begin
						always @(posedge clk or negedge in_enable) begin
							if(~in_enable)
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= 0;
							else
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= reg_out_data[y][x * color_width - 1 : (x - 1)* color_width];
						end
					end
				end
				assign out_data[(y + 1) * color_width * window_width - 1 : y * color_width * window_width] = 
					out_ready ? reg_out_data[y] : 0;
			end

		end else begin

			reg in_enable_last;
			always @(posedge clk)
				in_enable_last <= in_enable;
			reg reg_input_ack;
			assign input_ack = reg_input_ack;
			always @(posedge clk) begin
			//	if(~rst_n)
			//		con_init <= 0;
				 if(con_init == window_width_half + 1)
					con_init <= con_init;
				else if(~in_enable_last & in_enable)
					con_init <= con_init + 1;
				else
					con_init <= con_init;
			end
			assign out_ready = con_init == window_width_half + 1 ? 1 : 0;
			always @(posedge clk) begin
			//	if(~rst_n)
			//		reg_input_ack <= 0;
				if(~in_enable_last & in_enable)
					reg_input_ack <= 1;
				else if(in_enable_last & ~in_enable)
					reg_input_ack <= 0;
			end

			for (y = 0; y < window_width; y = y + 1) begin
				for (x = 0; x < window_width; x = x + 1) begin
					if (x == 0) begin 
						always @(posedge clk) begin
					//		if(~rst_n)
						//		reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= 0;
						if(~in_enable_last & in_enable)
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= in_data[(y + 1) * color_width - 1 : y * color_width];
							else
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= reg_out_data[y][(x + 1) * color_width - 1 : x * color_width];
						end
					end else begin
						always @(posedge clk) begin
						//	if(~rst_n)
						//		reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= 0;
							if(~in_enable_last & in_enable)
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= reg_out_data[y][x * color_width - 1 : (x - 1)* color_width];
							else 
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= reg_out_data[y][(x + 1) * color_width - 1 : x * color_width];
						end
					end
				end
				assign out_data[(y + 1) * color_width * window_width - 1 : y * color_width * window_width] = 
					out_ready ? reg_out_data[y] : 0;
			end

		end
		
	endgenerate

endmodule