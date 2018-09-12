`timescale 1ns / 1ps

module run_cdoc_tb();
	
	reg reset,closeSignal,openSignal,clk1hz=0;
	reg [3:0] floor;
	reg request1,request4,request6,request8;
	reg request4up,request4down;
	reg request6up,request6down;
	
	wire [1:0] runState,preState; //3-up,1-down,2-open,0-close
	wire [3:0] nowFloor;
	wire [3:0] leftTime;
	wire [3:0] runLeftTime,openLeftTime;//used to simulation
	
	run DUT1(reset,closeSignal,openSignal,clk1hz,
		request1,request4,request6,request8,
		request4up,request4down,
		request6up,request6down,
		floor,
		nowFloor,leftTime,
		runState,preState,
		runLeftTime,openLeftTime);
		
	always @ (nowFloor)
    begin
       floor=nowFloor;
    end
		
	initial
	begin
		floor<=8;
		closeSignal<=0;openSignal<=0;reset<=0;
		request1<=0;request4<=0;request6<=0;request8<=0;
		request4up<=0;request4down<=0;request6up<=0;request6down<=0;
		
		//simulate closed to up to open to closed
		#20 reset<=1;
		#10 request6<=1;request1<=1;request4<=1;request8<=1;
	end
	
	always #5 clk1hz<=~clk1hz;
	
endmodule
