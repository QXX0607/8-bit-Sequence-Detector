module count4(x3,x2,x1,x0,z7,z6,z5,z4,z3,z2,z1,z0,clk,rst_n,sclk);
input clk,rst_n;
input x3,x2,x1,x0;
input sclk;

output z7,z6,z5,z4,z3,z2,z1,z0;

reg z7,z6,z5,z4,z3,z2,z1,z0;
reg [2:0] pstate;
//reg key_out_reg;///
//reg [2:0] count_low;//
//reg [2:0] count_high;//
reg[1:0] key_in_r;
reg[19:0] cnt_base;
reg outclk;
reg[5:0] count;

//	always @(posedge clk)
//		if(sclk ==1'b0)//�͵�ƽȡ��ͳ��
//			count_low <= count_low + 1;
//		else
//			count_low <= 0;
//
//	always @(posedge clk)
//		if(sclk ==1'b1)//�ߵ�ƽȡ��ͳ��
//			count_high <= count_high + 1;
//		else
//			count_high <= 0;
//
//	always @(posedge clk)//ȡ������
//		if(count_high == 3)
//		begin
//			key_out_reg <= 1;
//		end
//		else if(count_low == 3)
//		begin
//			key_out_reg <= 0;
//		end
		

always @(posedge sclk)
begin
	key_in_r[0]=key_in_r[1];
	key_in_r[1]=clk;
	if(key_in_r[1]==key_in_r[0])
	begin
		cnt_base=cnt_base+1;
		if(cnt_base==400)
		begin
			outclk=key_in_r[1];
			cnt_base=0;
		end
	end
	else
		cnt_base=0;
end
			
always @(posedge clk)
begin
   z7=x3;
	z6=x2;
	z5=x1;
	z4=x0;
end



parameter  
          s0=3'd0,
	       s1=3'd1,
          s2=3'd2,
          s3=3'd3,
          s4=3'd4,
          s5=3'd5,
          s6=3'd6,
          s7=3'd7;
			 
//always @(posedge clk or negedge rst_n)

//always @(pstate or x3)
always @(posedge outclk or negedge rst_n)
begin
	//x3
	if(!rst_n)
	begin
		  pstate=s0;
		  z3=1'b0;
		  z2=1'b0;
		  z1=1'b0;
		  z0=1'b0;
		  count=0;
	end
	else
	begin
		if (pstate==s7 && x3==1)
		begin
		count=count+1;
			case(count)
			1:z0=1'b1;
			2:begin z0=1'b0;z1=1'b1;end
			3:begin z0=1'b1;z1=1'b1;end
			4:begin z0=1'b0;z1=1'b0;z2=1'b1;end
			5:begin z0=1'b1;z1=1'b0;z2=1'b1;end
			6:begin z0=1'b0;z1=1'b1;z2=1'b1;end
			7:begin z0=1'b1;z1=1'b1;z2=1'b1;end
			8:begin z0=1'b0;z1=1'b0;z2=1'b0;z3=1'b1;end
			9:begin z0=1'b1;z1=1'b0;z2=1'b0;z3=1'b1;end
			10:begin z0=1'b0;z1=1'b1;z2=1'b0;z3=1'b1;end
			11:begin z0=1'b1;z1=1'b1;z2=1'b0;z3=1'b1;end
			12:begin z0=1'b0;z1=1'b0;z2=1'b1;z3=1'b1;end
			13:begin z0=1'b1;z1=1'b0;z2=1'b1;z3=1'b1;end
			14:begin z0=1'b0;z1=1'b1;z2=1'b1;z3=1'b1;end
			15:begin z0=1'b1;z1=1'b1;z2=1'b1;z3=1'b1;end
			endcase
		end
		case(pstate)
		  s0:
				pstate=x3?s1:s0;//如果输入为0，则跳向下一S1状态，否则跳回本状态
		  s1:
				pstate=x3?s1:s2;
		  s2:
				pstate=x3?s3:s0;
		  s3:
				pstate=x3?s1:s4;
		  s4:
				pstate=x3?s3:s5;
		  s5:
				pstate=x3?s6:s0;
		  s6:
				pstate=x3?s1:s7;//如果输入为0，则跳回到S1状态，否则跳向下一状态
		  s7:
				pstate=x3?s3:s0;//如果输入为1，则从S0状态从头开始
		  default:
            pstate=s0;
    endcase
	
	//x2
		if (pstate==s7 && x2==1)
			begin
			count=count+1;
			case(count)
			1:z0=1'b1;
			2:begin z0=1'b0;z1=1'b1;end
			3:begin z0=1'b1;z1=1'b1;end
			4:begin z0=1'b0;z1=1'b0;z2=1'b1;end
			5:begin z0=1'b1;z1=1'b0;z2=1'b1;end
			6:begin z0=1'b0;z1=1'b1;z2=1'b1;end
			7:begin z0=1'b1;z1=1'b1;z2=1'b1;end
			8:begin z0=1'b0;z1=1'b0;z2=1'b0;z3=1'b1;end
			9:begin z0=1'b1;z1=1'b0;z2=1'b0;z3=1'b1;end
			10:begin z0=1'b0;z1=1'b1;z2=1'b0;z3=1'b1;end
			11:begin z0=1'b1;z1=1'b1;z2=1'b0;z3=1'b1;end
			12:begin z0=1'b0;z1=1'b0;z2=1'b1;z3=1'b1;end
			13:begin z0=1'b1;z1=1'b0;z2=1'b1;z3=1'b1;end
			14:begin z0=1'b0;z1=1'b1;z2=1'b1;z3=1'b1;end
			15:begin z0=1'b1;z1=1'b1;z2=1'b1;z3=1'b1;end
				endcase
			end
			case(pstate)
		  s0:
				pstate=x2?s1:s0;//如果输入为0，则跳向下一S1状态，否则跳回本状态
		  s1:
				pstate=x2?s1:s2;
		  s2:
				pstate=x2?s3:s0;
		  s3:
				pstate=x2?s1:s4;
		  s4:
				pstate=x2?s3:s5;
		  s5:
				pstate=x2?s6:s0;
		  s6:
				pstate=x2?s1:s7;//如果输入为0，则跳回到S1状态，否则跳向下一状态
		  s7:
				pstate=x2?s3:s0;//如果输入为1，则从S0状态从头开始
		  default:
				pstate=s1;
	   endcase
	
	//x1
	
	
	
	
		if (pstate==s7 && x1==1)
			begin
			count=count+1;
			case(count)
			1:z0=1'b1;
			2:begin z0=1'b0;z1=1'b1;end
			3:begin z0=1'b1;z1=1'b1;end
			4:begin z0=1'b0;z1=1'b0;z2=1'b1;end
			5:begin z0=1'b1;z1=1'b0;z2=1'b1;end
			6:begin z0=1'b0;z1=1'b1;z2=1'b1;end
			7:begin z0=1'b1;z1=1'b1;z2=1'b1;end
			8:begin z0=1'b0;z1=1'b0;z2=1'b0;z3=1'b1;end
			9:begin z0=1'b1;z1=1'b0;z2=1'b0;z3=1'b1;end
			10:begin z0=1'b0;z1=1'b1;z2=1'b0;z3=1'b1;end
			11:begin z0=1'b1;z1=1'b1;z2=1'b0;z3=1'b1;end
			12:begin z0=1'b0;z1=1'b0;z2=1'b1;z3=1'b1;end
			13:begin z0=1'b1;z1=1'b0;z2=1'b1;z3=1'b1;end
			14:begin z0=1'b0;z1=1'b1;z2=1'b1;z3=1'b1;end
			15:begin z0=1'b1;z1=1'b1;z2=1'b1;z3=1'b1;end
			endcase
		end
		case(pstate)
		  s0:
				pstate=x1?s1:s0;//如果输入为0，则跳向下一S1状态，否则跳回本状态
		  s1:
				pstate=x1?s1:s2;
		  s2:
				pstate=x1?s3:s0;
		  s3:
				pstate=x1?s1:s4;
		  s4:
				pstate=x1?s3:s5;
		  s5:
				pstate=x1?s6:s0;
		  s6:
				pstate=x1?s1:s7;//如果输入为0，则跳回到S1状态，否则跳向下一状态
		  s7:
				pstate=x1?s3:s0;//如果输入为1，则从S0状态从头开始
		  default:
				pstate=s1;
	   endcase
	
	//x0
		if (pstate==s7 && x0==1)
					begin
		count=count+1;
		case(count)
			1:z0=1'b1;
			2:begin z0=1'b0;z1=1'b1;end
			3:begin z0=1'b1;z1=1'b1;end
			4:begin z0=1'b0;z1=1'b0;z2=1'b1;end
			5:begin z0=1'b1;z1=1'b0;z2=1'b1;end
			6:begin z0=1'b0;z1=1'b1;z2=1'b1;end
			7:begin z0=1'b1;z1=1'b1;z2=1'b1;end
			8:begin z0=1'b0;z1=1'b0;z2=1'b0;z3=1'b1;end
			9:begin z0=1'b1;z1=1'b0;z2=1'b0;z3=1'b1;end
			10:begin z0=1'b0;z1=1'b1;z2=1'b0;z3=1'b1;end
			11:begin z0=1'b1;z1=1'b1;z2=1'b0;z3=1'b1;end
			12:begin z0=1'b0;z1=1'b0;z2=1'b1;z3=1'b1;end
			13:begin z0=1'b1;z1=1'b0;z2=1'b1;z3=1'b1;end
			14:begin z0=1'b0;z1=1'b1;z2=1'b1;z3=1'b1;end
			15:begin z0=1'b1;z1=1'b1;z2=1'b1;z3=1'b1;end
			endcase
		end
		case(pstate)
		  s0:
				pstate=x0?s1:s0;//如果输入为0，则跳向下一S1状态，否则跳回本状态
		  s1:
				pstate=x0?s1:s2;
		  s2:
				pstate=x0?s3:s0;
		  s3:
				pstate=x0?s1:s4;
		  s4:
				pstate=x0?s3:s5;
		  s5:
				pstate=x0?s6:s0;
		  s6:
				pstate=x0?s1:s7;//如果输入为0，则跳回到S1状态，否则跳向下一状态
		  s7:
				pstate=x0?s3:s0;//如果输入为1，则从S0状态从头开始
		  default:
				pstate=s1;
	   endcase
	end
end
endmodule