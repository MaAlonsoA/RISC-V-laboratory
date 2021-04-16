.data 

integer: .word 5
str: .string "Hello World!"

.text
begin:

lw a2,integer
jal ra,printInt

jal ra,printEndl

la a2,str
jal ra,printStr

end:
li a7,10
ecall


#-------------------------------------------------------------------------------------------
printInt: 	# a2 (in): value to print (int)
			# Function: This procedure recives one integer and print it
beginPrint:
#-----------
# Save context
addi sp,sp,-12
sw a7,8(sp)
sw a0,4(sp)
sw a2,0(sp)
#-----------
mv a0,a2
li a7,1
ecall
#-----------
endPrint:
# Restore Context

lw a2,0(sp)
lw a0,4(sp)
lw a7,8(sp)
addi sp,sp,-12
#-----------
jalr zero,ra,0
#-------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------
printStr: 	# a2 (in): value to print (string)
			# Function: This procedure recives a string and print it
beginPrintSrtr:
#-----------
# Save context
addi sp,sp,-12
sw a7,8(sp)
sw a0,4(sp)
sw a2,0(sp)
#-----------
mv a0,a2
li a7,4
ecall
#-----------
endPrintStr:
# Restore Context
lw a2,0(sp)
lw a0,4(sp)
lw a7,8(sp)
addi sp,sp,12
#-----------
jalr zero,ra,0
#-------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------
printEndl: 	# nothing (in): 
			# Function: This procedure recives nothing and print and endl line
beginPrintEndl:
#-----------
# Save context
addi sp,sp,-8
sw a7,4(sp)
sw a0,0(sp)
#-----------
li a0,10		#Line Feed
li a7,11
ecall
#-----------
endPrintEndl:
# Restore Context
lw a0,0(sp)
lw a7,4(sp)
addi sp,sp,8

#-----------
jalr zero,ra,0
#-------------------------------------------------------------------------------------------