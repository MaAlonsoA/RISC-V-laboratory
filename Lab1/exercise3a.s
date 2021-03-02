.data 
A: .word 5
B: .word 3
R: .word 0

.text
begin:

lw a2,A
lw a3,B
rem a0,a2,a3

la t0, R		#Load the R address
sw a0,0(t0)		#Save result on R

li a7,1
lw a0,R
ecall

end:
li a7,10
ecall

