# InverseMatrixonFPGA


verilog Code for inverting matrix of FPGA!

# Warning : This code is not working for floating point

# Another thing is you have to create RAM module to run this code!

Proof !!!


I run [ I | I ] matrix and then try to see that there is any change has been done in row and col....
and result is same...!!!
So,Code is working under non-floating entries of given matrix or inversed matrix.===>

![alt tag](https://github.com/immortal3/InverseMatrixonFPGA/blob/master/RAM.PNG?raw=true)


Ignore first row and first col in ram datasheet and then try to map next row and col to 5*10 matrix.!!!
(after 5*10 matrix is compeleted...all other entries are append with 1.)

