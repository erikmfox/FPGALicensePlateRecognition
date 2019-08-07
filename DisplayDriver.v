

module VGA_Controller(
    input           enable_1,
    input           enable_2,
    input           enable_3,
    input           enable_4,
    input           enable_5,
    input           enable_6,
    input           enable_7,
    input           clk25,          // 25Mhz clock for VGA 640x480
	output  [3:0]   vga_red,        // VGA RED
	output  [3:0]   vga_green,      // VGA GREEN
    output  [3:0]   vga_blue,       // VGA BLUE
    output          vga_hsync,      // Horizontal sync pulse
    output          vga_vsync,      // Vertical sync pulse
    output  [14:0]  frame_addr,     // Address to read from memory
    input   [11:0]  frame_pixel,     // Data read from a memory location
    output wenable,   
    output [5:0] leds_result
); 
reg [5:0] leds;
	// Timing constants
	parameter hRez         = 639; 
	parameter hStartSync   = 659; 
	parameter hEndSync     = 755; 
	parameter hMaxCount    = 799; 
	
	parameter vRez         = 480; 
	parameter vStartSync   = 493; 
	parameter vEndSync     = 494; 
	parameter vMaxCount    = 524; 
	
	// Pixel row and col 
	reg [9:0] hCounter = {10{1'b0}};
	reg [9:0] vCounter = {10{1'b0}};
//	reg [9:0] x_pos = {10{1'b0}};
  //  reg [9:0] y_pos = {10{1'b0}};
	// Address to read from memory
	//reg [15:0] address = {16{1'b0}};
	reg [14:0] address = 15'd19;
	reg we = 1'b1;
	// Flag to indicate the area to display images
	reg blank = 0;
	
	// Internal signals for VGA interface
	reg [3:0]  vga_red_temp = 0;
	reg [3:0]  vga_blue_temp = 0;
	reg [3:0]  vga_green_temp = 0;
	reg        vga_hsync_temp = 0;
	reg        vga_vsync_temp = 0;
	reg        [31:0] counter_enable;
    

	always @(posedge clk25) begin
	//if (enable) begin
	    // Increasement horizontal sync counter
	   // if  (enable_1 == 1'b1) begin
	     //  counter_enable <= counter_enable + 1'b1;
	     //  end
    
         counter_enable <= counter_enable + 1'b1; 	    
	    if (counter_enable >= 32'd1500000000) begin
	    counter_enable <= 32'd0;
	    end
	    
	    
	    if (hCounter == hMaxCount)	
            hCounter <= 10'd0;
        else    
            hCounter <= hCounter + 10'd1;
	    
	    // Increasement vertical sync counter
	    if ((vCounter >= vMaxCount) && (hCounter >= hMaxCount))
            vCounter <= 10'd0;
        else if (hCounter == hMaxCount)
            vCounter <= vCounter + 10'd1;

        // Generate RGB value for VGA display
        // if blank is asserted, the area will be black
        // if blank is de-asserted, the area will have color
	    if(blank == 0) begin
			vga_red_temp   <= frame_pixel[11:8];
        vga_green_temp <= frame_pixel[7:4];
        vga_blue_temp <= frame_pixel[3:0];
//        vga_red_temp   <= {4{1'b1}};
//                vga_green_temp <= {4{1'b1}};
//                vga_blue_temp <= {4{1'b1}};
	    end
	    else begin
			vga_red_temp   <= {4{1'b0}};
			vga_green_temp <= {4{1'b0}};
			vga_blue_temp <= {4{1'b0}};
	    end
		
		// Indicate area to display images
		// blank is only de-asserted if the column pixel less than 640
		// and row pixel less than 480
	if(counter_enable >= 32'd0 && counter_enable <= 32'd250000000) begin
	   leds <= 6'b100011;
        if(vCounter >= vRez) begin
           //address <= {16{1'b0}};
           address <= 15'd19;
           we <= 1'b0;
            blank <= 1;
        end
        else begin
     //       if(hCounter < 200 && vCounter < 105) begin
     //           blank <= 0;
                // Double size the image to display full screen
                // Otherwise, it will have duplicate image or half screen will be black
               // if (hCounter[1] == 1'b1)
       //        we <= 1'b0; 
         //      address <= address+1'b1;
          //  end
          if(hCounter < 25 && vCounter < 105) begin
          blank <= 0;
                        if (hCounter == 10'd24) begin
                         address <= address+15'd176;
                       end
                     else begin 
                         address<= address + 1'b1;
                     end
                      end
            else blank <= 1;                     
        end
            end
            
           else if(counter_enable >= 32'd250000000 && counter_enable <= 32'd500000000) begin
           leds <= 6'b011010;
                    if(vCounter >= vRez) begin
                       address <= 15'd44;
                       we <= 1'b0;
                        blank <= 1;
                    end
                    else begin

                      if(hCounter < 25 && vCounter < 105) begin
                      blank <= 0;
                                    if (hCounter == 10'd24) begin
                                     address <= address+15'd176;
                                   end
                                 else begin 
                                     address<= address + 1'b1;
                                 end
                                  end
                        else blank <= 1;                     
                    end
                        end
            
            
            
             else if(counter_enable >= 32'd500000000 && counter_enable <= 32'd750000000) begin
               leds <= 6'b011011;
                                          if(vCounter >= vRez) begin
                                             //address <= {16{1'b0}};
                                             address <= 15'd69;
                                             we <= 1'b0;
                                              blank <= 1;
                                          end
                                          else begin
                                       //       if(hCounter < 200 && vCounter < 105) begin
                                       //           blank <= 0;
                                                  // Double size the image to display full screen
                                                  // Otherwise, it will have duplicate image or half screen will be black
                                                 // if (hCounter[1] == 1'b1)
                                         //        we <= 1'b0; 
                                           //      address <= address+1'b1;
                                            //  end
                                            if(hCounter < 25 && vCounter < 105) begin
                                            blank <= 0;
                                                          if (hCounter == 10'd24) begin
                                                           address <= address+15'd176;
                                                         end
                                                       else begin 
                                                           address<= address + 1'b1;
                                                       end
                                                        end
                                              else blank <= 1;                     
                                          end
                                              end
            
             else if(counter_enable >= 32'd750000000 && counter_enable <= 32'd1000000000) begin
             leds <= 6'b001000;
                                                                                       if(vCounter >= vRez) begin
                                                                                          //address <= {16{1'b0}};
                                                                                          address <= 15'd122;
                                                                                          we <= 1'b0;
                                                                                           blank <= 1;
                                                                                       end
                                                                                       else begin
                                                                                    //       if(hCounter < 200 && vCounter < 105) begin
                                                                                    //           blank <= 0;
                                                                                               // Double size the image to display full screen
                                                                                               // Otherwise, it will have duplicate image or half screen will be black
                                                                                              // if (hCounter[1] == 1'b1)
                                                                                      //        we <= 1'b0; 
                                                                                        //      address <= address+1'b1;
                                                                                         //  end
                                                                                         if(hCounter < 25 && vCounter < 105) begin
                                                                                         blank <= 0;
                                                                                                       if (hCounter == 10'd24) begin
                                                                                                        address <= address+15'd176;
                                                                                                      end
                                                                                                    else begin 
                                                                                                        address<= address + 1'b1;
                                                                                                    end
                                                                                                     end
                                                                                           else blank <= 1;                     
                                                                                       end
                                                                                           end
            
                     else if(counter_enable >= 32'd1000000000 && counter_enable <= 32'd1250000000) begin
                     leds <= 6'b000110;
                                                                                                                                                                         if(vCounter >= vRez) begin
                                                                                                                                                                            //address <= {16{1'b0}};
                                                                                                                                                                            address <= 15'd149;
                                                                                                                                                                            we <= 1'b0;
                                                                                                                                                                             blank <= 1;
                                                                                                                                                                         end
                                                                                                                                                                         else begin
                                                                                                                                                                      //       if(hCounter < 200 && vCounter < 105) begin
                                                                                                                                                                      //           blank <= 0;
                                                                                                                                                                                 // Double size the image to display full screen
                                                                                                                                                                                 // Otherwise, it will have duplicate image or half screen will be black
                                                                                                                                                                                // if (hCounter[1] == 1'b1)
                                                                                                                                                                        //        we <= 1'b0; 
                                                                                                                                                                          //      address <= address+1'b1;
                                                                                                                                                                           //  end
                                                                                                                                                                           if(hCounter < 25 && vCounter < 105) begin
                                                                                                                                                                           blank <= 0;
                                                                                                                                                                                         if (hCounter == 10'd24) begin
                                                                                                                                                                                          address <= address+15'd176;
                                                                                                                                                                                        end
                                                                                                                                                                                      else begin 
                                                                                                                                                                                          address<= address + 1'b1;
                                                                                                                                                                                      end
                                                                                                                                                                                       end
                                                                                                                                                                             else blank <= 1;                     
                                                                                                                                                                         end
                                                                                                                                                                             end
                                                                                              
            
                     else if(counter_enable >= 32'd1250000000 && counter_enable <= 32'd1500000000) begin
                     leds <= 6'b000111;
                                                                                                                                                                                                                                                           if(vCounter >= vRez) begin
                                                                                                                                                                                                                                                              //address <= {16{1'b0}};
                                                                                                                                                                                                                                                              address <= 15'd174;
                                                                                                                                                                                                                                                              we <= 1'b0;
                                                                                                                                                                                                                                                               blank <= 1;
                                                                                                                                                                                                                                                           end
                                                                                                                                                                                                                                                           else begin
                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                             if(hCounter < 25 && vCounter < 105) begin
                                                                                                                                                                                                                                                             blank <= 0;
                                                                                                                                                                                                                                                                           if (hCounter == 10'd24) begin
                                                                                                                                                                                                                                                                            address <= address+15'd176;
                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                        else begin 
                                                                                                                                                                                                                                                                            address<= address + 1'b1;
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                         end
                                                                                                                                                                                                                                                               else blank <= 1;                     
                                                                                                                                                                                                                                                           end
                                                                                                                                                                                                                                                               end
                                                                                                                                                                                                                                                               
                                                                                                                                                                    
            
            
            
            
            
            
		// generate active-low horizontal sync pulse
        vga_hsync_temp <=  ~((hCounter >= hStartSync) && (hCounter <= hEndSync));
				
		// generate active-low vertical sync pulse
        vga_vsync_temp <= ~((vCounter >= vStartSync) && (vCounter <= vEndSync));
             		
	end
	//end
	// Assign value to output ports 
	assign frame_addr = address;
	assign vga_red = vga_red_temp;
	assign vga_blue = vga_blue_temp;
	assign vga_green = vga_green_temp;
	assign vga_hsync = vga_hsync_temp;
	assign vga_vsync = vga_vsync_temp; 
	assign wenable = we;
	assign leds_result = leds;	
endmodule
