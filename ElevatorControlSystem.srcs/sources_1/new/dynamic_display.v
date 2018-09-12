`timescale 1ns / 1ps

module dynamic_display(
	nowFloor, leftTime,
	clk,reset,
	seg,an
    );
    
	input [3:0] nowFloor, leftTime;
	input clk;
	input reset;
	output wire [7:0] seg;
	output reg [7:0] an;
	
	reg [7:0] floorData,timeData;
	reg [3:0] data;
	reg [15:0] times;
	
	initial times=0;
	
	SevenSeg_Decoder dec1(data,reset,seg);
	
	parameter COUNTER_N=80000;
	
	always @ (nowFloor,leftTime)
	begin
		if(nowFloor>9)
		begin
			floorData[7:4]=1;
			floorData[3:0]=nowFloor-10;
		end
		else floorData={4'b0000,nowFloor};
		if(leftTime>9)
		begin
			timeData[7:4]=1;
			timeData[3:0]=leftTime-10;
		end
		else timeData={4'b0000,leftTime};
	end
	
	always @ (posedge clk)
		begin
			times=times+16'b1;
			if(times==COUNTER_N)
				times=16'b0;
		end
		
	always @ (posedge clk)
		begin
			if(times>(COUNTER_N/4*3))
			begin
				data=floorData[7:4];
				an=8'b11111101;
			end
			else if(times>(COUNTER_N/2))
			begin
				data=floorData[3:0];
				an=8'b11111110;
			end
			else if(times>(COUNTER_N/4))
			begin
				data=timeData[7:4];
				an=8'b11110111;
			end
			else
			begin
				data=timeData[3:0];
				an=8'b11111011;
			end
		end
endmodule
