`timescale 1ns / 1ps

module run(
reset,closeSignal,openSignal,clk1hz,
request1,request4,request6,request8,
request4up,request4down,
request6up,request6down,
floor,
nowFloor,leftTime,
runState,preState,
runLeftTime,openLeftTime
    );//runLeftTime and openLeftTime used to simulation
    
	input reset,closeSignal,openSignal,clk1hz;
	input [3:0] floor;
	input request1,request4,request6,request8;
	input request4up,request4down;
	input request6up,request6down;
	
	output reg [1:0] runState,preState; //0-close,1-down,2-open,3-up
	output reg [3:0] nowFloor;
	output reg [3:0] leftTime;
	output reg [3:0] runLeftTime,openLeftTime;//initial value zero when not simulating
	
    always@(posedge clk1hz,posedge closeSignal)
        //response to run clock and the closeSignal
		begin
			if(reset == 0)
			begin
				runState = 0;//close
				preState=0;
				leftTime = 0;
				openLeftTime=0;
				runLeftTime=0;
				nowFloor=1;
			end

			else
			begin
				nowFloor=floor;
				if(runState == 3) //up
				begin
					leftTime = runLeftTime;

					if(nowFloor == 8)//elevator stop at top floor
					begin //change the state to open
						preState=3;
						runState = 2;
						openLeftTime=5;
					end

					else if(runLeftTime == 0)//not top and stop at one floor higher
					begin
						if(((nowFloor==3)&&(request4 || request4up))||(nowFloor==5&&(request6 ||request6up))||(nowFloor==7&&(request8)))
						begin //the door of these floor can be open
							preState=3;
							runState = 2;
							openLeftTime=5;
						end

						nowFloor = nowFloor + 1;
						if(nowFloor!=8) runLeftTime = 10;
					end

					else//the elevator is uping
					runLeftTime= runLeftTime - 1;//time decrease
				end //end with state of up

				else if(runState == 1) //the elevator is downing
				begin
					leftTime = runLeftTime;

					if(nowFloor == 1)//elevator stops at bottom
					begin //change the state to open
						preState=1;
						runState = 2;
						openLeftTime=5;
					end

					else if(runLeftTime == 0)//not bottom and stop at one floor lower
					begin //princeple: continue the present state--down first
						if(((nowFloor==2)&&(request1))||((nowFloor==5)&&(request4==1 ||request4down))||((nowFloor==7)&&(request6 ||request6down)))
						begin //the door can be open, change the state to open
							preState=1;
							runState = 2;
							openLeftTime=5;
						end

						nowFloor = nowFloor - 1;
						if(nowFloor!=1) runLeftTime = 10;//arrive at bottom
					end

					else//the elevator is downing
						runLeftTime = runLeftTime - 1;//time decrease
				end //end with state of down

				else if(runState == 2) //door is open
				begin
					leftTime = openLeftTime;
					if(openSignal) openLeftTime=5; //reset openLeftTime
					if(openLeftTime == 0 || closeSignal)
					begin //change the state to closed
						openLeftTime = 0;
						runState = 0;
					end

					else //wait elevator to close the door
						openLeftTime = openLeftTime - 1;
				end

				else //door is closed, closed means stop
				begin //nowFloor can only be equal to 1.4.6.8
					leftTime = 0;
					if(openSignal)
					begin //response to openSignal first
						runState = 2;
						openLeftTime = 5;
					end
					
					else if(nowFloor == 1 )//elevator stop at bottom
					begin //response to request of higher floor
						if(request4||request4up||request4down||request6||request6up||request6down||request8)
						begin //change the state to up
							runState = 3;
							runLeftTime = 10;
						end
					end

					else if(nowFloor == 4 )
					begin //princeple: up first, down later
						if(request1&&preState==1)//continue to down
						begin //change the state to down
							runState = 1;
							runLeftTime = 10;
						end
						
						else if(request6||request6up||request6down||request8)
						begin //change the state to up
							runState = 3;
							runLeftTime = 10;
						end
					end

					else if(nowFloor == 6)
					begin //princeple: up first, down later	
						if((request1||request4||request4up||request4down)&&preState==1)
						begin //change the state to down
							runState = 1;
							runLeftTime = 10;
						end
						
						else if(request8)
						begin //change the state to up
							runState = 3;
							runLeftTime = 10;
						end
					end
					
					else //elevator stop at top
					begin //response to the request of lower floor
						if(request1||request4||request4up||request4down||request6||request6up||request6down)
						begin //change the state to down
							runState = 1;
							runLeftTime = 10;
						end
					end
				end //end with runState=3 closed
			end //end with reset=1
        end
endmodule
