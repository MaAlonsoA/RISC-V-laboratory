.data
A: .word 5
B: .word 3
R: .word 0


.text
begin:

lw a2,A
lw a3,B

div a4,a2,a3
mul a5,a3,a4  	# Divisor * Quotient

sub a6,a2,a5  	# Get reminder

la t0,R
sw a6,0(t0)		#Save the result

lw a0,R
li a7,1
ecall

end:
li a7,10
ecall