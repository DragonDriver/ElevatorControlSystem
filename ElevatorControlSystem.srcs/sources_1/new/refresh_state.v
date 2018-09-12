`timescale 1ns / 1ps

module refresh_state(
reset,clk,
inButton1,inButton4,inButton6,inButton8,
outUp1,outUp4,outDown4,
outUp6,outDown6,outDown8,
upLight,downLight,
openLight,closeLight,
floor,
request1,request4,request6,request8,
request4up,request4down,
request6up,request6down,
runState);

	input reset,clk;
	input inButton1,inButton4,inButton6,inButton8;
	
	input outUp1,outUp4,outDown4;
	input outUp6,outDown6,outDown8;
	
	input [3:0] floor;
	
	input [1:0] runState;//0-close,1-down,2-open,3-up
	
	output reg request1,request4,request6,request8;
	output reg request4up,request4down;
	output reg request6up,request6down;
	
	output reg upLight,downLight;
	output reg openLight,closeLight;
	
	always@(posedge clk)
	begin
		if(reset==0)
		begin
			request1 = 0;request4 = 0;request6 = 0;request8 = 0;
			request4up = 0;request6up = 0;
			request4down = 0;request6down = 0;
			upLight = 0;
			downLight = 0;
			openLight = 0;
			closeLight = 0;
		end
		
		else 
		begin
			if(inButton1 || outUp1) request1 = 1;
			if(inButton4 ) request4 = 1;
			if(inButton6 ) request6 = 1;
			if(inButton8 || outDown8) request8 = 1;
			if(outUp4) request4up = 1;
			if(outDown4) request4down = 1;
			if(outUp6) request6up = 1;
			if(outDown6) request6down = 1;
		end
		
		if((floor==1) && request1) request1 =0;
	
		else if(floor == 4)
		begin
			if(request4==1) request4 = 0;
			if(runState==3 && (request4up==1)) request4up = 0;
			if(runState==1 && (request4down==1)) request4down = 0;
		end
		
		else if(floor == 6)
		begin
			if(request6==1) request6 = 0;
			if(runState==3 && (request6up==1)) request6up = 0;
			if(runState==1 && (request6down==1)) request6down = 0;
		end
		
		else if((floor==8) && request8 ) request8 =0;
		
		if(runState == 3)
		begin
			upLight = 1;
			downLight = 0;
			openLight = 0;
			closeLight = 1;
			if(~reset) closeLight = 0;
		end
		
		else if(runState == 1)
		begin
			upLight = 0;
			downLight = 1;
			openLight = 0;
			closeLight = 1;
		end
		
		else if(runState == 2)
		begin
			upLight = 0;
			downLight = 0;
			openLight = 1;
			closeLight = 0;
		end
		
		else//runState==0,closed
		begin
			upLight = 0;
			downLight = 0;
			openLight = 0;
			closeLight = 1;
		end
	end
	
endmodule