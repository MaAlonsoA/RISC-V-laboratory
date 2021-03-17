.data

inputText: 	.string "En un Lugar de la m%ancha de cuyo nombre no quiero acordarme."
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

# Check if the letter is a blank space, capital letter or special character
li t3,97 						# ASCII value for a 'a'
blt t2,t3,insert				# ASCII < 97
li t3,123						# ASCII value for a 'z'	 + 1				
bge t2,t3,insert				# ACII > 123
# Just if the character is between 'a' or 'z' [97,122]
addi t2,t2,-32					# Capitalize
## End check

# Insert character, then go next letter
insert:
add t0,t1,a2					# Calculate the memory position (output) with the offset
sb t2,0(t0)						# Save the word in output
beq t2,t2,next
## End insert 

next:
addi t1,t1,1					# Increment offset by 1
beq t0,t0,loop

break:
# Insert the end '.'
add t0,t1,a2					# Calculate the memory position (output) with the offset
sb t2,0(t0)						# Save the word in output
la a0,outputText
li a7,4
ecall

end:
li a7,10
ecall
