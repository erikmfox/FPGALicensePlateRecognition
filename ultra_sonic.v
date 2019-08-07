`timescale 1ns / 1ps

/*
Ultrasonic distance calculator
When the object is in Range 10-20 cm, the LED turns on
If the object is outside the range, the LED turns off
*/
module ultra_sonic(clk,echo,trig,led);

//Input Declaration
input clk;
input echo;

//Output Declaration
output reg trig;
output reg led;

//Distance counter and general counter
reg [31:0] dist_counter;
reg [31:0] counter;

always@(posedge clk)
    begin
        if(counter==0)                                                        //Send the trig pulse
        trig<=1;
    
        if(counter==1000)                                                     //Count upto 1000 which evaluates to 10us with 100 mhz clock
        begin
            trig<=0;
        end
            
        if(counter<32'd10000000)                                             //Keep going if counter is not equal to 10000000
        begin
            if(echo==1)
            begin
                dist_counter<=dist_counter+1;  
            end
            counter<=counter+1;
        end
        else																//Time to send another pulse in 100ms
        begin
            counter<=0;
            dist_counter<=0;
        end
        if(echo==0)
        begin
            if(dist_counter>58800 && dist_counter<117600)
                led<=1;
            else
                led<=0;
        end 
    end
endmodule
