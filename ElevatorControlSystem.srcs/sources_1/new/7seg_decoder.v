`timescale 1ns / 1ps

module  SevenSeg_Decoder(inData, reset, outData);
    input reset;
    input   [3:0]inData;
    output  [7:0]outData;
    reg     [7:0]outData;
    always@(inData or reset)
        begin
            if(reset==0)
                outData = 8'b1111_1111;
            else
                case(inData)     
                    4'd0: outData = 8'b1100_0000;
                    4'd1: outData = 8'b1111_1001;
                    4'd2: outData = 8'b1010_0100;
                    4'd3: outData = 8'b1011_0000;
                    4'd4: outData = 8'b1001_1001;
                    4'd5: outData = 8'b1001_0010;
                    4'd6: outData = 8'b1000_0010;
                    4'd7: outData = 8'b1111_1000;
                    4'd8: outData = 8'b1000_0000;
                    4'd9: outData = 8'b1001_0000;
                    default: outData = 8'b1111_1111;
                 endcase
         end 
endmodule
