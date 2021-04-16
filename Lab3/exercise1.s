.data 
year: .word 2005
isLeap:.string " is a leap year"
isNotLeap: .string " is not a leap year"

.text
begin:
lw a2,year

#Print Year
lw a0,year
li a7,1
ecall
# --------------------------------------------------------------------------------------------------------------------
#
#	The algorithm used to determine whether a given year is a leap year has been obtained from the following source:
# 	https://docs.microsoft.com/en-us/office/troubleshoot/excel/determine-a-leap-year
#
# --------------------------------------------------------------------------------------------------------------------

step1:
#	If the given year is not evenly divisible by 4, the given year is not a leap
li a3,4
rem a0,a2,a3
li t1,0
bne a0,t1,notLeap

step2:
# 	If the given year also is not evenly divisible by 100, the given year is leap
li a3,100
rem a0,a2,a3
li t1,0
bne a0,t1,leap

step3:
# 	If the given year also is not evenly divisible by 400, the given year is not leap
li a3,400
rem a0,a2,a3
li t1,0
bne a0,t1,notLeap

leap:
la, a0,isLeap
li a7,4
ecall
beq t1,t1,end

notLeap:
la, a0,isNotLeap
li a7,4
ecall

end:
li a7,10
ecall