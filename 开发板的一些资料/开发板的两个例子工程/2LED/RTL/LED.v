/****************************************Copyright (c)**************************************************
**                                      Dongdong   Studio 
**                                     
**---------------------------------------File Info-----------------------------------------------------
** File name:           LED
** Last modified Date:  2014-6-1
** Last Version:        1.1
** Descriptions:        LED
**------------------------------------------------------------------------------------------------------
** Created by:          dongdong
** Created date:        2009-10-18
** Version:             1.0
** Descriptions:        The original version
**
**------------------------------------------------------------------------------------------------------
** Modified by:         			
** Modified date:		
** Version:				
** Descriptions:		
**
**------------------------------------------------------------------------------------------------------
********************************************************************************************************/

module LED(
                  //input
input			      sys_clk               ,//system clock;
input			      sys_rst_n             ,//system reset,low is active;
			         //output
output  reg[7:0]	LED
          );

//parameter define
parameter WIDTH2    =20                      ;
parameter WIDTH     =8                       ;
parameter Para      =0                       ;

//reg define
reg        [WIDTH-1:0]    count              ;
reg        [WIDTH2-1:0]   counter            ;

//**************************************************************************
//**
//**                             Main Program
//**************************************************************************/

//count for add counter,0.5s/20ns=25000000,need 24 bit cnt
always @(posedge sys_clk or negedge sys_rst_n)begin
    if(sys_rst_n==1'b0)begin
		  counter <=20'b0;
	 end
	 else
		  counter <=counter+1'b1;
	 end
		  
//two counter to realize the cnt division 
always @(posedge sys_clk or negedge sys_rst_n)begin
    if(sys_rst_n==1'b0)begin
		 count <=8'b0;
    end
	 else if(counter==Para)
		  count <= count+1'b1;
end

//ctr the LED pipiline display when count is equal to 10,20.. 		  
always @(posedge sys_clk or negedge sys_rst_n) begin 
        if (sys_rst_n ==1'b0) begin 
            LED <= 8'b0;
        end
        else begin
            case (count) 
                 10     : LED = 8'b00000001   ;
                 20     : LED = 8'b00000010   ;
                 30     : LED = 8'b00000100   ;
                 40     : LED = 8'b00001000   ;
                 50     : LED = 8'b00010000   ;
                 60     : LED = 8'b00100000   ;
                 70     : LED = 8'b01000000   ;
                 80     : LED = 8'b10000000   ;   
                 default: LED = 8'b00000000   ;   
            endcase
        end          
end


endmodule
//end of rtl code
				
		  
		  

		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  


     