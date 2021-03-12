.data

inputText: 	.string "letras"
outputText:	.string ""

.text

begin:
la a1,inputText
la a2, outputText
li s0,6							# Loop stop condition
li t0,0							# Iterator
li t1,0							# Initial Offset

loop:
beq t0,s0,break					# If iterator == stop condition then break

add t2,t1,a1					# Calculate the input with the offset
lb t4,0(t2)						# Load the letter

addi t4,t4,-32					# Capitalize

add t3,t1,a2					# Calculate the output with the offset
sb t4,0(t3)						# Saved the letter in output 

addi t1,t1,1					# Increment Offset
addi t0,t0,1					# Iterator++
beq a1,a1,loop

break:
la a0,outputText
li a7,4
ecall

end:
li a7,10
ecall
