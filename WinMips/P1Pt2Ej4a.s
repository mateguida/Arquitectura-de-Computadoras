.data
CONTROL: .word 0x10000
DATA: .word 0x10008
color: .byte 0, 100, 0, 0
mensajeIngreseX: .asciiz "Ingrese coordenada X = "
mensajeIngreseY: .asciiz "Ingrese coordenada Y = "

.code
ld $s1, CONTROL($zero)
ld $s2, DATA($zero)
ld $s3, color($zero)

daddi $t2, $0, mensajeIngreseX
sd $t2, 0($s2)
daddi $t1, $zero, 4
sd $t1, 0($s1)
daddi $t1, $zero, 8
sd $t1, 0($s1)
lbu $s4, 0($s2)

daddi $t1, $zero, 6
sd $t1, 0($s1)

daddi $t2, $0, mensajeIngreseY
sd $t2, 0($s2)
daddi $t1, $zero, 4
sd $t1, 0($s1)
daddi $t1, $zero, 8
sd $t1, 0($s1)
lbu $s5, 0($s2)

sw $s3, 0($s2)
sb $s4, 5($s2)
sb $s5, 4($s2)

daddi $t1, $zero, 5
sd $t1, 0($s1)
halt
