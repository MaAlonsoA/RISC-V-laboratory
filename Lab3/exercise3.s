.data 
year: .word 2006
isLeapStr:.string " is a leap year"
isNotLeapStr: .string " is not a leap year"

.text
begin:

lw a2,year
jal ra,isLeap
mv s1,a0 # Saves the result because s0 is often used for screen printing.

li t1,1 # True
bne s1,t1,false # If s1 is not 1 the print not leap year
#---------------
# Print leap year
lw a2,year
jal ra,printInt

la a2,isLeapStr
jal ra,printStr

beq t1,t1,end
#---------------

#---------------
# Print not leap year
false:
lw a2,year
jal ra,printInt
la a2,isNotLeapStr
jal ra,printStr
#---------------

end:
jal ra,printEndl
li a7,10
ecall


#-------------------------------------------------------------------------------------------
isLeap: 	# a2 (in): value to check if is leap
			# a0 (out): 0 (false) or 1 (true)
			# Function: This procedure receives an integer and checks if this year is a leap year.
beginIsLeap:
#-----------
# Save context
addi sp,sp,-12
sw t2,8(sp)
sw t1,4(sp)
sw a2,0(sp)
#-----------
step1:
#	If the given year is not evenly divisible by 4, the given year is not a leap
li t1,4
rem t2,a2,t1
li t1,0
bne t2,t1,notLeap

step2:
# 	If the given year also is not evenly divisible by 100, the given year is leap
li t1,100
rem t2,a2,t1
li t1,0
bne t2,t1,leap

step3:
# 	If the given year also is not evenly divisible by 400, the given year is not leap
li t1,400
rem t2,a2,t1
li t1,0
bne t2,t1,notLeap

leap:
li,a0,1
beq a0,a0,endIsLeap
notLeap:
li,a0,0
beq a0,a0,endIsLeap
#-----------
endIsLeap:
# Restore Context
lw a2,0(sp)
lw t1,4(sp)
lw t2,8(sp)
addi sp,sp,12
#-----------
jalr zero,ra,0
#-------------------------------------------------------------------------------------------

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
addi sp,sp,-4
sw a2,0(sp)
#-----------
mv a0,a2
li a7,4
ecall
#-----------
endPrintStr:
# Restore Context
lw a2,0(sp)
addi sp,sp,4
#-----------
jalr zero,ra,0
#-------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------
printEndl: 	# nothing (in): 
			# Function: This procedure recives nothing and print and endl line
beginPrintEndl:
#-----------
# Save context

#-----------
li a0,10		#Line Feed
li a7,11
ecall
#-----------
endPrintEndl:
# Restore Context

#-----------
jalr zero,ra,0
#-------------------------------------------------------------------------------------------


