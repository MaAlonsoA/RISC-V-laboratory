.data

inputText: 	.string "en un lugar de la mancha de cuyo nombre no quiero acordarme."
outputText:	.string ""

.text

begin:
la a1,inputText
la a2, outputText
li s0,46						# Loop stop condition (ASCII value for '.')
li,t1,0 						# Memory position offset 

loop:
add t0,t1,a1					# Calculate the memory position with the offset
lb t2,0(t0)						# Load a letter in t2

beq t2,s0,break					# If t2 == stop condition then break


# Check if input is a blank space. If true insert it
li t3,32						# ASCII value for blank space
beq t2,t3,insert				
## End check

addi t2,t2,-32					# Capitalize

# Insert
insert:
add t0,t1,a2					# Calculate the memory position (output) with the offset
sb t2,0(t0)						# Save the word in output
## End Insert

addi t1,t1,1					# Increment Offset

beq s0,s0,loop

break:
# Insert the last '.'
add t0,t1,a2					# Calculate the memory position (output) with the offset
sb t2,0(t0)						# Save the word in output
la a0,outputText
li a7,4
ecall

end:
li a7,10
ecall
