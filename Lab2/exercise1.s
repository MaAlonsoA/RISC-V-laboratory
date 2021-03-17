.data

inputText: 	.string "letras"
outputText:	.string ""

.text

la a1, inputText
la a2, outputText

lb t1,0(a1)				#Load the start letter
addi t1,t1,-32			#Capitalize
sb t1,0(a2)				#Save the letter in outputText

lb t1,1(a1)				
addi t1,t1,-32			
sb t1,1(a2)				

lb t1,2(a1)				
addi t1,t1,-32			
sb t1,2(a2)				

lb t1,3(a1)				
addi t1,t1,-32			
sb t1,3(a2)				

lb t1,4(a1)				
addi t1,t1,-32			
sb t1,4(a2)				

lb t1,5(a1)				#Load the end (6) letter
addi t1,t1,-32			#Capitalize
sb t1,5(a2)				#Save the letter outputText

begin:
la a0,outputText
li a7,4
ecall

end:
li a7,10
ecall
