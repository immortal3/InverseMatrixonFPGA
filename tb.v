`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:55:10 10/06/2016
// Design Name:   InverseMatrix
// Module Name:   E:/SEM-3/LA/matrix/tb.v
// Project Name:  matrix
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InverseMatrix
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg start;
	reg clk;

	// Outputs
	wire [31:0] ram1;
	wire [31:0] write;

	// Instantiate the Unit Under Test (UUT)
	InverseMatrix uut (
		.ram1(ram1), 
		.start(start), 
		.clk(clk), 
		.write(write)
	);

	initial begin
		// Initialize Inputs
		start = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
     always
	begin
		#1 clk = ~clk; 
	end
    
endmodule

