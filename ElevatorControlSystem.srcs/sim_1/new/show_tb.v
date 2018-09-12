`timescale 1ns / 1ps

module show_tb();
	reg [3:0] nowFloor, leftTime;
	reg clk;
	reg reset;
	
	wire [7:0] seg;
	wire [7:0] an;
	
	defparam show1.COUNTER_N=4;
	dynamic_display show1(nowFloor,leftTime,clk,reset,seg,an);
	
	always #2 clk=~clk;
	
	initial
	begin
		clk<=0;
		#3 reset<=1;nowFloor<=8;leftTime<=10;
		#16 nowFloor<=4;leftTime<=5;
		#16 nowFloor<=8;leftTime<=10;
		#16 nowFloor<=0;leftTime<=0;
	end
endmodule
