.data
cadena: .asciiz "adbdcdedfdgdhdid"
car: .asciiz "d"
cant: .word 0

.code
;cargo el caracter al s1
;s1 = "d"
daddi $t1, $zero, car
lbu $s1, 0($t1)

;s2 = offset cadena
daddi $t2, $zero, cadena
loop: lbu $s2, 0($t2)

beq $s1, $s2, igual
j seguir

igual: daddi $t3, $t3, 1

seguir: daddi $t2, $t2, 1 

bnez $s2, loop
sd $t3, cant($zero)
halt