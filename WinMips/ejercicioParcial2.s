;14. Se cuenta con 1 srreglo liamado TABLA que coutiene 15 elemeitos. Escribir un programa para el
;winmips64 que genere un nuevo arreglo, a partir de la dirección NUEVO, que contenga sólo aquellos
;elementos del arreglo TABLA que sean mayores a MAYOR: También se debe establecer la cantidad dè
;elementos de éste nuevo areglo en la dirección CANTIDAD.
.data
TABLA: .word 4,11,18,6,17,28,9,0,11,23,15,6,37,29,14
MAYOR: .word 10
CANTIDAD: .word 15
NUEVO: .word 0

.code
daddi $s1, $0, TABLA
ld $s2, MAYOR($0)
ld $s3, CANTIDAD($0)
daddi $s4, $0, 0
daddi $t3, $0, 0

loop:
ld $t1, 0($s1)
slt $t2, $t1, $s2
daddi $s3, $s3, -1
bnez $t2, noAgregar
sd $t1, NUEVO($t3)
daddi $s4, $s4, 1
daddi $t3, $t3, 8
noAgregar: daddi $s1, $s1, 8
bnez $s3, loop

sd $s4, CANTIDAD($0)

halt