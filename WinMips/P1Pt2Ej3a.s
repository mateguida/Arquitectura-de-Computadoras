.data
CONTROL: .word 0x10000
DATA: .word 0x10008
mensajeIngrese: .asciiz "Ingrese un numero"
resultado: .asciiz "El resultado es = "

.code
;guardo direcciones de control y data para referenciar esas memorias
ld $s1, CONTROL($0)
ld $s2, DATA($0)

;imprimo mensaje que ingrese un numero
daddi $t1, $0, mensajeIngrese
sd $t1, 0($s2)
daddi $t1, $0, 4
sd $t1, 0($s1)

;espero la entrada y la guardo en s3
daddi $t1, $0, 8
sd $t1, 0($s1)
ld $s3, 0($s2)

daddi $t1, $0, 8
sd $t1, 0($s1)
ld $s4, 0($s2)

daddi $t1, $0, resultado
sd $t1, 0($s2)
daddi $t1, $0, 4
sd $t1, 0($s1)

dadd $s5, $s3, $s4

sd $s5, 0($s2)
daddi $t1, $0, 2
sd $t1, 0($s1)

halt