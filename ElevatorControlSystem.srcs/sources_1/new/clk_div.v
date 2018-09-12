`timescale 1ns / 1ps

module clk_div(clk_in,reset,clk_out);
	
	input clk_in;
	input reset;
	output clk_out;

	reg clk_out;
	reg [31:0] count;

	parameter  factor_N_div2=10000000;
	always @(posedge clk_in)
		begin
			if(!reset)
			begin
				count <= 0;
				clk_out <= 0;
			end

			else if(count==factor_N_div2-1)
			begin
				clk_out=~clk_out;
				count<=0;
			end

			else count=count+1;
		end
endmodule
