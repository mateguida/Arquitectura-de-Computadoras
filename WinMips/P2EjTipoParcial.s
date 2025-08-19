
;  Implementar una subrutina INGRESAR_NUMERO. La misma deberá solicitar el ingreso por teclado de un
;  número entero del 1 al 9. Si el número ingresado es un número válido entre 1 y 9 la subrutina deberá
;  imprimir por pantalla el número ingresado y retornar dicho valor. En caso contrario, la subrutina deberá
;  imprimir por pantalla “Debe ingresar un número” y devolver el valor 0. Para ello, implementar y usar una
;  subrutina ENTRE que reciba un número N y otros dos números B y A, y devuelva 1 si B<N<A o 0 de lo
;  contrario.
;  Usando la subrutina INGRESAR_NUMERO implementar un programa que invoque a dicha subrutina y
;  genere una tabla llamada NUMEROS con los valores ingresados. La generación de la tabla finaliza cuando la
;  suma de los resultados obtenidos sea mayor o igual a el valor almacenado en la dirección MAX.

;  Al finalizar la generación de la tabla, deberá invocar a la subrutina PROCESAR_NUMEROS, que debe recibir
;  como parámetro la dirección de la tabla NUMEROS y la cantidad de elementos y contar la cantidad de
;  números impares ingresados. Se debe mostrar por pantalla el valor calculado, con el texto "Cantidad de
;  Valores Impares: “ y el valor. Para ello, utilizar la subrutina ES_IMPAR codificada anteriormente.
.data
ingresarNumero: .asciiz "Debe ingresar un numero "
mostrarImpares: .asciiz "Cantidad de valores impares: "
max: .word 24
CONTROL: .word 0x10000
DATA: .word 0x10008
tablaNumeros: .word 0

.code
ld $s1, CONTROL($0)
ld $s2, DATA($0)
daddi $s3, $0, 0
ld $s4, max($0)
daddi $s5, $0, 0
daddi $s6, $0, tablaNumeros
daddi $sp, $sp , 0x400

repetir: jal ingresarNum
beqz $v0, repetir
sd $v1, 0($s6) ; guardo el numero en la tabla nueva
daddi $s3, $s3, 1 ; incremento cantidad de elementos ingresados
daddi $s6, $s6, 8 ; paso al siguiente elemento de la tabla 
dadd $s5, $s5, $v1 ; sumatoria para comparar con el max
slt $t1, $s5, $s4 ; comparo con el max
bnez $t1, repetir ; si es menor repite el proceso

daddi $a0, $0, tablaNumeros
dadd $a1, $0, $s3
jal procesarNumeros
halt

;procesar numeros
procesarNumeros:
daddi $t5, $0, 0
loop: ld $t1, 0($a0)
andi $t2, $t1, 1
beqz $t2, seguir
daddi $t5, $t5, 1
seguir: daddi $a1, $a1, -1
daddi $a0, $a0, 8
bnez $a1, loop

daddi $t1, $0, 6
sd $t1, 0($s1)

daddi $t1, $0, mostrarImpares
sd $t1, 0($s2)
daddi $t1, $0, 4
sd $t1, 0($s1)

sd $t5, 0($s2)
daddi $t1, $0, 2
sd $t1, 0($s1)

jr $ra

;Ingresar Numero
ingresarNum:
daddi $t1, $0, 6
sd $t1, 0($s1)

daddi $t1, $0, ingresarNumero
sd $t1, 0($s2)
daddi $t1, $0, 4
sd $t1, 0($s1)

daddi $t1, $0, 8
sd $t1, 0($s1)

daddi $sp, $sp, -8
sd $ra, 0($sp)

ld $a0, 0($s2)
ld $v1, 0($s2)
daddi $a1, $0, 1
daddi $a2, $0, 9
jal entre
beqz $v0, finSR

daddi $t1, $0, 2
sd $t1, 0($s1)

finSR: ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

;Entre
entre: 
daddi $v0, $0, 0
slt $t3, $a0, $a2
beqz $t3, fin
slt $t3, $a0, $a1
bnez $t3, fin
daddi $v0, $0, 1
fin: jr $ra