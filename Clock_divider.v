///////////////////////////////////////////////////////////////////////////
// Clock_divider.v - clock divider
//
// Created By:		Thanh Tien Truong
//
// Description:
// ------------
// Generate 1/2 clock signal from an input clock source
//
///////////////////////////////////////////////////////////////////////////

module Clock_divider(
    input   clk_in,               // Input clock 
    output  clk_out              // Output 1/2 clock
);
    // Internal clock value
    reg int_clock_out = 0;
    
    // FF_for generate 1/2 clock signal
    always @ (posedge clk_in) begin
            int_clock_out <= ~int_clock_out; 
    end
        
    // Assign value to output
    assign clk_out = int_clock_out;
    
endmodule
