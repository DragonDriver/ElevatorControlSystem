`timescale 1ns / 1ps

module elevator(
reset,closeSignal,openSignal,clk,
inButton1,inButton4,inButton6,inButton8,
outUp1,outUp4,outDown4,
outUp6,outDown6,outDown8,
seg,an,
powerLight,upLight,downLight,
openLight,closeLight,
request1,request4,request6,request8,
request4up,request4down,
request6up,request6down
);

	input reset,closeSignal,openSignal,clk;
	input inButton1,inButton4,inButton6,inButton8;
	input outUp1,outUp4,outDown4;
	input outUp6,outDown6,outDown8;

	output [7:0] seg;//七段数码显示管
	output [7:0] an;//片选信号
	output upLight,downLight,openLight,closeLight;
	output powerLight;

	wire clk1hz;

	wire [3:0] floor;
	
	//to show request state
	output wire request1,request4,request6,request8;
	output wire request4up,request4down;
	output wire request6up,request6down;
	
	wire [1:0] runState,preState; //3-up,1-down,2-open,0-close

	wire [3:0] nowFloor;
	wire [3:0] leftTime;
	wire [3:0] runLeftTime,openLeftTime;//used to simulation

	assign powerLight = reset;
	assign floor=nowFloor;

    defparam get_1hzclk.factor_N_div2=50_000_000;
	clk_div get_1hzclk(clk,reset,clk1hz);
	
	//dynamicly display the number of floor and time
	dynamic_display show(nowFloor,leftTime,
						clk,reset,
						seg,an);

	//refresh led state and response to request
	refresh_state refs(reset,clk,
					inButton1,inButton4,inButton6,inButton8,
					outUp1,outUp4,outDown4,
					outUp6,outDown6,outDown8,
					upLight,downLight,
					openLight,closeLight,
					nowFloor,
					request1,request4,request6,request8,
					request4up,request4down,
					request6up,request6down,
					runState);
	
	//core module, control the run state
	run ele_run(reset,closeSignal,openSignal,clk1hz,
			request1,request4,request6,request8,
			request4up,request4down,
			request6up,request6down,
			floor,
			nowFloor,leftTime,
			runState,preState,
			runLeftTime,openLeftTime);
endmodule

