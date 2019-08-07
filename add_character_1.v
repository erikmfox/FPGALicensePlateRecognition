module addr_character_1(
input clk,
output [14:0] RAM_addr_1,
output we
);

	parameter hRez         = 639; 
	parameter hStartSync   = 659; 
	parameter hEndSync     = 755; 
	parameter hMaxCount    = 799; 
	
	parameter vRez         = 480; 
	parameter vStartSync   = 493; 
	parameter vEndSync     = 494; 
	parameter vMaxCount    = 524; 
reg [15:0] counter = {16{1'b0}};
reg [14:0] address = 15'd0;
reg wenable = 1'b1;
reg [9:0] hCounter = {10{1'b0}};
	reg [9:0] vCounter = {10{1'b0}};


always @ (posedge clk) begin

	 

	    if (hCounter == hMaxCount)	
            hCounter <= 10'd0;
        else    
            hCounter <= hCounter + 10'd1;
	    
	
	    if ((vCounter >= vMaxCount) && (hCounter >= hMaxCount))
            vCounter <= 10'd0;
        else if (hCounter == hMaxCount)
            vCounter <= vCounter + 10'd1;
	if(vCounter >= vRez) begin
                       address <= 15'd0;
                       wenable <= 1'b0;
                   
                    end
                    else begin
                        if(hCounter < 200 && vCounter < 105) begin
                   
        
                           wenable <= 1'b1; 
                           address <= address+1'b1;
                        end
                        end
end

assign RAM_addr_1 = address;
assign we = wenable;

endmodule
