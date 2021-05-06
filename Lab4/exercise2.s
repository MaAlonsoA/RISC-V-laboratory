.data

length: .word 7

list: 	.word 7
		.word 5
		.word -4
		.word 100
		.word -250
		.word 73
		.word -50

.text
la a1, list
lw a0, length

li,t0,0 				# Interator
jal ra,printArray

li s0,1 
jal ra,bubbleSort

jal ra,printEndl


jal ra,printArray

end:
li a7,10
ecall

#---------------------------------------------------------------------------------------------------------------
bubbleSort: # a0(in): Length of the array
			# a1(in): Pointer to the beginning of the array
			# s0(in): Base case to exit recursive  
			# Function: Recursive implementation of bubble sort. Given an array returns the same array sorted
beginSort:
#-----------------
# Save context
addi sp,sp,-28
sw ra,24(sp)
sw s0,20(sp)
sw a0,16(sp)
sw a1,12(sp)
sw t0, 8(sp)
sw t1, 4(sp)
sw t2, 0(sp)

#-----------------


beq s0,a0 endSort		# If current size of the array >= 1 return

li t0,1					# Iterator 

loop:					# Loop to iterate the sub array resulting from the previous recursive iteration. for (int i=0; i<n-1; i++)
lw t1,0(a1)				# n[i]
lw t2,4(a1)				# n[i+1]

blt t1,t2,increment		# if n[i] < n[i+1] don't swap

#------swap---------
sw t2,0(a1)
sw t1,4(a1)
#-------------------
#-------------------
increment:
addi t0,t0,1			# Increment iterator
addi, a1,a1,4			# Set offset

blt t0,a0,loop			# if t0 != current size of the subarray continue
#-------------------
break:
addi a0,a0,-1
lw a1,12(sp)			# Restore the original pointer to the begining of the array
jal ra,bubbleSort

endSort:
# Restore Context
lw t2,0(sp)
lw t1,4(sp)
lw t0,8(sp)
lw a1,12(sp)
lw a0,16(sp)
lw s0,20(sp)
lw ra,24(sp)
addi sp,sp,28
#------------------
jalr zero,ra,0
#------------------
#---------------------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------------------
printArray:  	# a0(in): Length of the array
				# a1(in): Pointer to the beginning of the array 
				# t0(in): Iterator start in 0
				# Function: Iterate a given array and print on the screen each of the values separated by a line break

beginPrintArray:
#-----------------
# Save context
addi sp,sp,-20
sw ra,16(sp)
sw a0,12(sp)
sw a1,8(sp)
sw a2,4(sp)
sw t0,0(sp)
#-----------------

beq t0,a0,endPrintArray 	# If all values has been printed return

#------------------
# print int
lw a2,0(a1)
jal ra,printInt
#------------------
#------------------
# Print end line
jal ra,printEndl
#------------------

addi t0,t0,1 				# Increment interator
addi a1,a1,4				# Move pointer
jal ra,printArray

endPrintArray:
# Restore Context
lw t0,0(sp)
lw a2,4(sp)
lw a1,8(sp)
lw a0,12(sp)
lw ra,16(sp)
addi sp,sp,20
#------------------
jalr zero,ra,0
#------------------
#---------------------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------------------
printInt: 	# a2 (in): value to print (int)
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
#---------------------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------------------
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
#---------------------------------------------------------------------------------------------------------------