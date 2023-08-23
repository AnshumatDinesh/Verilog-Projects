module UART_Tx(
	input wire[7:0] Datain,
	input wire Clk,En,
	output reg Serial_op);
	wire parity;
	assign parity=Datain[0]^Datain[1]^Datain[2]^Datain[3]^Datain[4]^Datain[5]^Datain[6]^Datain[7];
	reg[11:0] dataframe;
	reg Serial_buf;
	always @(posedge Clk)
	begin
		if(En==0)
		 begin
			dataframe[0]=0;
			dataframe[10]=1;
			dataframe[11]=1;
			dataframe[1]=Datain[0];
			dataframe[2]=Datain[1];
			dataframe[3]=Datain[2];
			dataframe[4]=Datain[3];
			dataframe[5]=Datain[4];
			dataframe[6]=Datain[5];
			dataframe[7]=Datain[6];
			dataframe[8]=Datain[7];
			dataframe[9]=parity;
		end
	else
		if(dataframe==0)
			begin
				Serial_op=1;
			end
		else
			Serial_op=dataframe[0];
			dataframe=dataframe>>1;
		
	end 
endmodule
		