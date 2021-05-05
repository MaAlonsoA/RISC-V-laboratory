.data 

length: .word 7
list: 	.word 7
		.word 5
		.word -4
		.word 100
		.word 250
		.word 73
		.word -50

.text

bregin:
la a1,list
lw a0,length
li,t1,0 				# Interator count
jal ra,printArray


end:
li a7,10
ecall


#-------------------------------------------------------------------------------------------
printArray:  	# a0(in): Length of the array
				# a1(in): Pointer to the beginning of the array 
				# t1(in): Iterator start in 0
				# Function: Iterate a given array and print on the screen each of the values separated by a line break

beginPrintArray:
#-----------------
# Save context
addi sp,sp,-16
sw ra,12(sp)
sw t1,8(sp)
sw a1,4(sp)
sw a0,0(sp)
#-----------------

beq t1,a0,endPrintArray 	# If all values has been printed then break

#------------------
# print int
lw a2,0(a1)
jal ra,printInt
#------------------
#------------------
# Print end line
jal ra,printEndl
#------------------

addi t1,t1,1 				# Increment interator
addi a1,a1,4				# Move pointer
jal ra,printArray

endPrintArray:
# Restore Context
lw a0,0(sp)
lw a1,4(sp)
lw t1,8(sp)
lw ra,12(sp)
addi sp,sp,16
#------------------
jalr zero,ra,0
#------------------
#-------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------
printInt: 	# a0 (in): value to print (int)
			# Function: This procedure recives one integer and print it
beginPrint:
#------------------
# Save context
addi sp,sp,-12
sw a7,8(sp)
sw a0,4(sp)
sw a2,0(sp)
#------------------
mv a0,a2
li a7,1
ecall
#------------------
endPrint:
# Restore Context
lw a2,0(sp)
lw a0,4(sp)
lw a7,8(sp)
addi sp,sp,12
#------------------
jalr zero,ra,0
#-------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------
printEndl: 	# nothing (in): 
			# Function: This procedure recives nothing and print and endl line
beginPrintEndl:
#------------------
# Save context
addi sp,sp,-8
sw a7,4(sp)
sw a0,0(sp)
#------------------
li a0,10		#Line Feed
li a7,11
ecall
#------------------
endPrintEndl:
# Restore Context
lw a0,0(sp)
lw a7,4(sp)
addi sp,sp,8

#------------------
jalr zero,ra,0
#-------------------------------------------------------------------------------------------