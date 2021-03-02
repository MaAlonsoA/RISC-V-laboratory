.data
textA: 	.string "39steps"

.text
begin:
# a) Mostrar por pantalla el texto '39steps'

la a0,textA
li a7,4
ecall

end:
li a7,10
ecall



