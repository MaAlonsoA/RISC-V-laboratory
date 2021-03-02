.data
textB1: .string "39"
textB2: .string "steps"

.text
begin:

# b)	Mostrar por pantalla (en l�neas distintas) el texto '39
#															steps'

la a0,textB1	
li a7,4
ecall

li a0,10		#Line Feed
li a7,11
ecall

la a0,textB2
li a7,4
ecall

end:
li a7,10
ecall
