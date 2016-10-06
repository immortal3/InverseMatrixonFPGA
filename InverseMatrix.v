`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//
//			Patel Dip P.
//
//			For: Inverse 5*5 matrix on FPGA!!!!!.....
//					This is hard coded......
//
//
//		Warning : This code will not work for floating point.but it is working..
//
//////////////////////////////////////////////////////////////////////////////////
module InverseMatrix(ram1,start,clk,write);

input start,clk;
output [31:0]ram1;
output reg [31:0]write;

wire [5:0]addrRamin;
reg [5:0]addrRam;
reg [31:0]RamOut,Ramin;
reg [31:0]temp;
wire flag;
wire swapcount,swapflag;
reg [1:0] nextstage;
real matrix[0:4][0:9];
integer row = 0,col = 0;
real const;
reg writeflag;
reg delay ;


reg rowtemp,coltemp;
reg rowadditionflag;
reg iflag;

initial
begin
	nextstage = 2'b00;
	addrRam = 0;
	rowtemp = 0;
	rowadditionflag = 0;
	iflag = 1;
	writeflag = 0;
	delay = 0;
end



RAM ram (
  .clka(clk), // input clka
  .wea(writeflag), // input [0 : 0] wea
  .addra(addrRam), // input [5 : 0] addra
  .dina(Ramin), // input [15 : 0] dina
  .douta(ram1) // output [15 : 0] douta
);




always@(posedge clk)
begin
	if(nextstage == 2'b00)
	if(delay == 0)
	begin
		delay = 1;
		addrRam = addrRam + 1'b1;
	end
	else
	begin
	temp = ram1;
	matrix[row][col] =  ram1;
	//ram1 = RamOut;

		if(col < 10)
		begin
			if(col == 9)
			begin
				row = row + 1'b1;
				col = 0;
			end
			else
				col = col + 1;
		end
		if( row == 4)
		begin
			if(col == 9)
			begin
				nextstage = 2'b01;
			end
		end
		addrRam = addrRam + 1'b1;
	end
	else if(nextstage == 2'b01)
	begin
		//write = matrix[0][1];
		if(matrix[0][0] != 32'b0)
		begin
			const = matrix[1][0] / matrix[0][0];
			write = const;
			//write = 1;
			matrix[1][0] = matrix[1][0] - ((const)*matrix[0][0]);
			matrix[1][1] = matrix[1][1] - ((const)*matrix[0][1]);
			matrix[1][2] = matrix[1][2] - ((const)*matrix[0][2]);
			matrix[1][3] = matrix[1][3] - ((const)*matrix[0][3]);
			matrix[1][4] = matrix[1][4] - ((const)*matrix[0][4]);
			matrix[1][5] = matrix[1][5] - ((const)*matrix[0][5]);
			matrix[1][6] = matrix[1][6] - ((const)*matrix[0][6]);
			matrix[1][7] = matrix[1][7] - ((const)*matrix[0][7]);
			matrix[1][8] = matrix[1][8] - ((const)*matrix[0][8]);
			matrix[1][9] = matrix[1][9] - ((const)*matrix[0][9]);
		end
		if(matrix[0][0] != 0)
		begin
			const = matrix[2][0] / matrix[0][0];
			write = const;
			matrix[1][0] = matrix[1][0] - ((const)*matrix[0][0]);
			matrix[1][1] = matrix[1][1] - ((const)*matrix[0][1]);
			matrix[1][2] = matrix[1][2] - ((const)*matrix[0][2]);
			matrix[1][3] = matrix[1][3] - ((const)*matrix[0][3]);
			matrix[1][4] = matrix[1][4] - ((const)*matrix[0][4]);
			matrix[1][5] = matrix[1][5] - ((const)*matrix[0][5]);
			matrix[1][6] = matrix[1][6] - ((const)*matrix[0][6]);
			matrix[1][7] = matrix[1][7] - ((const)*matrix[0][7]);
			matrix[1][8] = matrix[1][8] - ((const)*matrix[0][8]);
			matrix[1][9] = matrix[1][9] - ((const)*matrix[0][9]);
		end
		if(matrix[0][0] != 0)
		begin
		//write = const;
			const = matrix[3][0] / matrix[0][0];
			matrix[1][0] = matrix[1][0] - ((const)*matrix[0][0]);
			matrix[1][1] = matrix[1][1] - ((const)*matrix[0][1]);
			matrix[1][2] = matrix[1][2] - ((const)*matrix[0][2]);
			matrix[1][3] = matrix[1][3] - ((const)*matrix[0][3]);
			matrix[1][4] = matrix[1][4] - ((const)*matrix[0][4]);
			matrix[1][5] = matrix[1][5] - ((const)*matrix[0][5]);
			matrix[1][6] = matrix[1][6] - ((const)*matrix[0][6]);
			matrix[1][7] = matrix[1][7] - ((const)*matrix[0][7]);
			matrix[1][8] = matrix[1][8] - ((const)*matrix[0][8]);
			matrix[1][9] = matrix[1][9] - ((const)*matrix[0][9]);
		end
		if(matrix[0][0] != 0)
		begin
		//write = const;
			const = matrix[4][0] / matrix[0][0];
			write = const;
			matrix[1][0] = matrix[1][0] - ((const)*matrix[0][0]);
			matrix[1][1] = matrix[1][1] - ((const)*matrix[0][1]);
			matrix[1][2] = matrix[1][2] - ((const)*matrix[0][2]);
			matrix[1][3] = matrix[1][3] - ((const)*matrix[0][3]);
			matrix[1][4] = matrix[1][4] - ((const)*matrix[0][4]);
			matrix[1][5] = matrix[1][5] - ((const)*matrix[0][5]);
			matrix[1][6] = matrix[1][6] - ((const)*matrix[0][6]);
			matrix[1][7] = matrix[1][7] - ((const)*matrix[0][7]);
			matrix[1][8] = matrix[1][8] - ((const)*matrix[0][8]);
			matrix[1][9] = matrix[1][9] - ((const)*matrix[0][9]);
		end
		if(matrix[1][1] != 0)
		begin
		//write = const;
			const = matrix[2][1] / matrix[1][1];
			write = const;
			matrix[2][0] = matrix[2][0] - ((const)*matrix[1][0]);
			matrix[2][1] = matrix[2][1] - ((const)*matrix[1][1]);
			matrix[2][2] = matrix[2][2] - ((const)*matrix[1][2]);
			matrix[2][3] = matrix[2][3] - ((const)*matrix[1][3]);
			matrix[2][4] = matrix[2][4] - ((const)*matrix[1][4]);
			matrix[2][5] = matrix[2][5] - ((const)*matrix[1][5]);
			matrix[2][6] = matrix[2][6] - ((const)*matrix[1][6]);
			matrix[2][7] = matrix[2][7] - ((const)*matrix[1][7]);
			matrix[2][8] = matrix[2][8] - ((const)*matrix[1][8]);
			matrix[2][9] = matrix[2][9] - ((const)*matrix[1][9]);
		end
		if(matrix[1][1] != 0)
		begin
			const = matrix[3][1] / matrix[1][1];
			write = const;
			matrix[2][0] = matrix[2][0] - ((const)*matrix[1][0]);
			matrix[2][1] = matrix[2][1] - ((const)*matrix[1][1]);
			matrix[2][2] = matrix[2][2] - ((const)*matrix[1][2]);
			matrix[2][3] = matrix[2][3] - ((const)*matrix[1][3]);
			matrix[2][4] = matrix[2][4] - ((const)*matrix[1][4]);
			matrix[2][5] = matrix[2][5] - ((const)*matrix[1][5]);
			matrix[2][6] = matrix[2][6] - ((const)*matrix[1][6]);
			matrix[2][7] = matrix[2][7] - ((const)*matrix[1][7]);
			matrix[2][8] = matrix[2][8] - ((const)*matrix[1][8]);
			matrix[2][9] = matrix[2][9] - ((const)*matrix[1][9]);
		end
		if(matrix[1][1] != 0)
		begin
			const = matrix[4][1] / matrix[1][1];
			write = const;
			matrix[2][0] = matrix[2][0] - ((const)*matrix[1][0]);
			matrix[2][1] = matrix[2][1] - ((const)*matrix[1][1]);
			matrix[2][2] = matrix[2][2] - ((const)*matrix[1][2]);
			matrix[2][3] = matrix[2][3] - ((const)*matrix[1][3]);
			matrix[2][4] = matrix[2][4] - ((const)*matrix[1][4]);
			matrix[2][5] = matrix[2][5] - ((const)*matrix[1][5]);
			matrix[2][6] = matrix[2][6] - ((const)*matrix[1][6]);
			matrix[2][7] = matrix[2][7] - ((const)*matrix[1][7]);
			matrix[2][8] = matrix[2][8] - ((const)*matrix[1][8]);
			matrix[2][9] = matrix[2][9] - ((const)*matrix[1][9]);
		end
		if(matrix[2][2] != 0)
		begin
			const = matrix[3][2] / matrix[2][2];
			write = const;
			matrix[3][0] = matrix[3][0] - ((const)*matrix[2][0]);
			matrix[3][1] = matrix[3][1] - ((const)*matrix[2][1]);
			matrix[3][2] = matrix[3][2] - ((const)*matrix[2][2]);
			matrix[3][3] = matrix[3][3] - ((const)*matrix[2][3]);
			matrix[3][4] = matrix[3][4] - ((const)*matrix[2][4]);
			matrix[3][5] = matrix[3][5] - ((const)*matrix[2][5]);
			matrix[3][6] = matrix[3][6] - ((const)*matrix[2][6]);
			matrix[3][7] = matrix[3][7] - ((const)*matrix[2][7]);
			matrix[3][8] = matrix[3][8] - ((const)*matrix[2][8]);
			matrix[3][9] = matrix[3][9] - ((const)*matrix[2][9]);
		end
		if(matrix[2][2] != 0)
		begin
			const = matrix[4][2] / matrix[2][2];
			write = const;
			matrix[3][0] = matrix[3][0] - ((const)*matrix[2][0]);
			matrix[3][1] = matrix[3][1] - ((const)*matrix[2][1]);
			matrix[3][2] = matrix[3][2] - ((const)*matrix[2][2]);
			matrix[3][3] = matrix[3][3] - ((const)*matrix[2][3]);
			matrix[3][4] = matrix[3][4] - ((const)*matrix[2][4]);
			matrix[3][5] = matrix[3][5] - ((const)*matrix[2][5]);
			matrix[3][6] = matrix[3][6] - ((const)*matrix[2][6]);
			matrix[3][7] = matrix[3][7] - ((const)*matrix[2][7]);
			matrix[3][8] = matrix[3][8] - ((const)*matrix[2][8]);
			matrix[3][9] = matrix[3][9] - ((const)*matrix[2][9]);
		end
		if(matrix[3][3] != 0)
		begin
			const = matrix[4][3] / matrix[3][3];
			write = const;
			matrix[4][0] = matrix[4][0] - ((const)*matrix[3][0]);
			matrix[4][1] = matrix[4][1] - ((const)*matrix[3][1]);
			matrix[4][2] = matrix[4][2] - ((const)*matrix[3][2]);
			matrix[4][3] = matrix[4][3] - ((const)*matrix[3][3]);
			matrix[4][4] = matrix[4][4] - ((const)*matrix[3][4]);
			matrix[4][5] = matrix[4][5] - ((const)*matrix[3][5]);
			matrix[4][6] = matrix[4][6] - ((const)*matrix[3][6]);
			matrix[4][7] = matrix[4][7] - ((const)*matrix[3][7]);
			matrix[4][8] = matrix[4][8] - ((const)*matrix[3][8]);
			matrix[4][9] = matrix[4][9] - ((const)*matrix[3][9]);
		end
		nextstage = 2'b10;
		addrRam = 0;
		row = 3;
		col = 3;
	end
	else if(nextstage == 2'b10 )
	begin
	if(matrix[4][4] != 0)
		begin
			const = matrix[3][4] / matrix[4][4];
			write = const;
			matrix[3][0] = matrix[3][0] - ((const)*matrix[4][0]);
			matrix[3][1] = matrix[3][1] - ((const)*matrix[4][1]);
			matrix[3][2] = matrix[3][2] - ((const)*matrix[4][2]);
			matrix[3][3] = matrix[3][3] - ((const)*matrix[4][3]);
			matrix[3][4] = matrix[3][4] - ((const)*matrix[4][4]);
			matrix[3][5] = matrix[3][5] - ((const)*matrix[4][5]);
			matrix[3][6] = matrix[3][6] - ((const)*matrix[4][6]);
			matrix[3][7] = matrix[3][7] - ((const)*matrix[4][7]);
			matrix[3][8] = matrix[3][8] - ((const)*matrix[4][8]);
		end
		if(matrix[4][4] != 0)
		begin
			const = matrix[2][4] / matrix[4][4];
			write = const;
			matrix[2][0] = matrix[2][0] - ((const)*matrix[4][0]);
			matrix[2][1] = matrix[2][1] - ((const)*matrix[4][1]);
			matrix[2][2] = matrix[2][2] - ((const)*matrix[4][2]);
			matrix[2][3] = matrix[2][3] - ((const)*matrix[4][3]);
			matrix[2][4] = matrix[2][4] - ((const)*matrix[4][4]);
			matrix[2][5] = matrix[2][5] - ((const)*matrix[4][5]);
			matrix[2][6] = matrix[2][6] - ((const)*matrix[4][6]);
			matrix[2][7] = matrix[2][7] - ((const)*matrix[4][7]);
			matrix[2][8] = matrix[2][8] - ((const)*matrix[4][8]);
		end
		if(matrix[4][4] != 0)
		begin
			const = matrix[1][4] / matrix[4][4];
			write = const;
			matrix[1][0] = matrix[1][0] - ((const)*matrix[4][0]);
			matrix[1][1] = matrix[1][1] - ((const)*matrix[4][1]);
			matrix[1][2] = matrix[1][2] - ((const)*matrix[4][2]);
			matrix[1][3] = matrix[1][3] - ((const)*matrix[4][3]);
			matrix[1][4] = matrix[1][4] - ((const)*matrix[4][4]);
			matrix[1][5] = matrix[1][5] - ((const)*matrix[4][5]);
			matrix[1][6] = matrix[1][6] - ((const)*matrix[4][6]);
			matrix[1][7] = matrix[1][7] - ((const)*matrix[4][7]);
			matrix[1][8] = matrix[1][8] - ((const)*matrix[4][8]);
		end
		if(matrix[4][4] != 0)
		begin
			const = matrix[0][4] / matrix[4][4];
			write = const;
			matrix[0][0] = matrix[0][0] - ((const)*matrix[4][0]);
			matrix[0][1] = matrix[0][1] - ((const)*matrix[4][1]);
			matrix[0][2] = matrix[0][2] - ((const)*matrix[4][2]);
			matrix[0][3] = matrix[0][3] - ((const)*matrix[4][3]);
			matrix[0][4] = matrix[0][4] - ((const)*matrix[4][4]);
			matrix[0][5] = matrix[0][5] - ((const)*matrix[4][5]);
			matrix[0][6] = matrix[0][6] - ((const)*matrix[4][6]);
			matrix[0][7] = matrix[0][7] - ((const)*matrix[4][7]);
			matrix[0][8] = matrix[0][8] - ((const)*matrix[4][8]);
		end
		if(matrix[3][3] != 0)
		begin
			const = matrix[2][3] / matrix[3][3];
			write = const;
			matrix[2][0] = matrix[2][0] - ((const)*matrix[3][0]);
			matrix[2][1] = matrix[2][1] - ((const)*matrix[3][1]);
			matrix[2][2] = matrix[2][2] - ((const)*matrix[3][2]);
			matrix[2][3] = matrix[2][3] - ((const)*matrix[3][3]);
			matrix[2][4] = matrix[2][4] - ((const)*matrix[3][4]);
			matrix[2][5] = matrix[2][5] - ((const)*matrix[3][5]);
			matrix[2][6] = matrix[2][6] - ((const)*matrix[3][6]);
			matrix[2][7] = matrix[2][7] - ((const)*matrix[3][7]);
			matrix[2][8] = matrix[2][8] - ((const)*matrix[3][8]);
		end
		if(matrix[3][3] != 0)
		begin
			const = matrix[1][3] / matrix[3][3];
			write = const;
			matrix[1][0] = matrix[1][0] - ((const)*matrix[3][0]);
			matrix[1][1] = matrix[1][1] - ((const)*matrix[3][1]);
			matrix[1][2] = matrix[1][2] - ((const)*matrix[3][2]);
			matrix[1][3] = matrix[1][3] - ((const)*matrix[3][3]);
			matrix[1][4] = matrix[1][4] - ((const)*matrix[3][4]);
			matrix[1][5] = matrix[1][5] - ((const)*matrix[3][5]);
			matrix[1][6] = matrix[1][6] - ((const)*matrix[3][6]);
			matrix[1][7] = matrix[1][7] - ((const)*matrix[3][7]);
			matrix[1][8] = matrix[1][8] - ((const)*matrix[3][8]);
		end
		if(matrix[3][3] != 0)
		begin
			const = matrix[0][3] / matrix[3][3];
			write = const;
			matrix[0][0] = matrix[0][0] - ((const)*matrix[3][0]);
			matrix[0][1] = matrix[0][1] - ((const)*matrix[3][1]);
			matrix[0][2] = matrix[0][2] - ((const)*matrix[3][2]);
			matrix[0][3] = matrix[0][3] - ((const)*matrix[3][3]);
			matrix[0][4] = matrix[0][4] - ((const)*matrix[3][4]);
			matrix[0][5] = matrix[0][5] - ((const)*matrix[3][5]);
			matrix[0][6] = matrix[0][6] - ((const)*matrix[3][6]);
			matrix[0][7] = matrix[0][7] - ((const)*matrix[3][7]);
			matrix[0][8] = matrix[0][8] - ((const)*matrix[3][8]);
		end
		if(matrix[2][2] != 0)
		begin
			const = matrix[1][2] / matrix[2][2];
			write = const;
			matrix[1][0] = matrix[1][0] - ((const)*matrix[2][0]);
			matrix[1][1] = matrix[1][1] - ((const)*matrix[2][1]);
			matrix[1][2] = matrix[1][2] - ((const)*matrix[2][2]);
			matrix[1][3] = matrix[1][3] - ((const)*matrix[2][3]);
			matrix[1][4] = matrix[1][4] - ((const)*matrix[2][4]);
			matrix[1][5] = matrix[1][5] - ((const)*matrix[2][5]);
			matrix[1][6] = matrix[1][6] - ((const)*matrix[2][6]);
			matrix[1][7] = matrix[1][7] - ((const)*matrix[2][7]);
			matrix[1][8] = matrix[1][8] - ((const)*matrix[2][8]);
		end
		if(matrix[2][2] != 0)
		begin
			const = matrix[0][2] / matrix[2][2];
			write = const;
			matrix[0][0] = matrix[0][0] - ((const)*matrix[2][0]);
			matrix[0][1] = matrix[0][1] - ((const)*matrix[2][1]);
			matrix[0][2] = matrix[0][2] - ((const)*matrix[2][2]);
			matrix[0][3] = matrix[0][3] - ((const)*matrix[2][3]);
			matrix[0][4] = matrix[0][4] - ((const)*matrix[2][4]);
			matrix[0][5] = matrix[0][5] - ((const)*matrix[2][5]);
			matrix[0][6] = matrix[0][6] - ((const)*matrix[2][6]);
			matrix[0][7] = matrix[0][7] - ((const)*matrix[2][7]);
			matrix[0][8] = matrix[0][8] - ((const)*matrix[2][8]);
		end
		if(matrix[1][1] != 0)
		begin
			const = matrix[0][1] / matrix[1][1];
			matrix[0][0] = matrix[0][0] - ((const)*matrix[1][0]);
			matrix[0][1] = matrix[0][1] - ((const)*matrix[1][1]);
			matrix[0][2] = matrix[0][2] - ((const)*matrix[1][2]);
			matrix[0][3] = matrix[0][3] - ((const)*matrix[1][3]);
			matrix[0][4] = matrix[0][4] - ((const)*matrix[1][4]);
			matrix[0][5] = matrix[0][5] - ((const)*matrix[1][5]);
			matrix[0][6] = matrix[0][6] - ((const)*matrix[1][6]);
			matrix[0][7] = matrix[0][7] - ((const)*matrix[1][7]);
			matrix[0][8] = matrix[0][8] - ((const)*matrix[1][8]);
		end
		addrRam = 0;
		writeflag = 1'b1;
		row = 0;
		col = 0;
		nextstage = 2'b11;
		Ramin =  matrix[row][col];
		row <= row + 1;
		col <= col + 1;
	end
	else if(nextstage == 2'b11 )
	begin
		Ramin =  matrix[row][col];
		//write = $realtobits(matrix[row][col]);
		write = row;
		if(col < 10)
			begin
				if(col == 9)
				begin
					row = row + 1'b1;
					col = 0;
				end
				else
					col = col + 1;
			end
			if( row == 5)
			begin
				if(col == 0)
				begin
					$finish;
				end
			end
		addrRam = addrRam + 1;
	end
end




endmodule
