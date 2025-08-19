; Escriba un programa que solicite el ingreso por teclado de una clave, representada por un
; string de 4 carácteres. Para indicar al usuario que debe ingresar un valor, imprimir en pantalla “Ingrese una clave de
; 4 carácteres”. Luego, debe comparar la secuencia ingresada con una cadena almacenada en la variable clave. Si las
; dos cadenas son iguales entre sí, mostrar el texto “Clave correcta: acceso permitido” en la salida estándar del
; simulador (ventana Terminal). En cambio, si las cadenas no son iguales, mostrar “Clave incorrecta.”
.data
claveDefinida: .asciiz "puto"
mensajeIngresar: .asciiz "Ingrese una clave de 4 caracteres"
claveIngresada: .word 0
claveCorrecta: .asciiz "Clave correcta: acceso permitido"
claveIncorrecta: .asciiz "Clave incorrecta"
CONTROL: .word 0x10000 
DATA: .word 0x10008

.code
ld $s1, CONTROL($zero)
ld $s2, DATA($zero)

;offset clave definida
daddi $s3, $0, claveDefinida

;Imprimir mensaje ingrese clave
daddi $t1, $0, mensajeIngresar ; offset menasajeingresar
sd $t1, 0($s2) ;Data = mando direc para imprmimr mensaje
daddi $t2, $0, 4; 4 = comando para imprmiir
sd $t2, 0($s1); mando comando para imprimir a control

daddi $t4, $0, 4
daddi $t3, $0, claveIngresada ;guardo offset para guardar la clave ingresada
loop: daddi $t2, $0, 9 ;9 = comando para ingresar caracter
sd $t2, 0($s1) ;Mando el 9 a control
lbu $s4, 0($s2);se guarda el caracter de data en el s4
sb $s4, 0($t3);guardo el caracter en claveingresada
daddi $t4, $t4, -1;decremento cant de caracteres
daddi $t3, $t3, 1;paso al siguiente caracter
bnez $t4, loop;si no es 0 la cantidad de caracteres restantes vuelvo al loop

daddi $t3, $0, claveIngresada ;t3 = offset calve ingresada
ld $t6, 0($t3) ;t6 = clave ingresada
ld $t7, 0($s3) ; t7 = clave definida 
beq $t6, $t7, acceder

daddi $t1, $0, claveIncorrecta
sd $t1, 0($s2)
daddi $t2, $0, 6
sd $t2, 0($s1)
daddi $t2, $0, 4
sd $t2, 0($s1)
j fin

acceder: daddi $t1, $0, claveCorrecta
sd $t1, 0($s2)
daddi $t2, $0, 6
sd $t2, 0($s1)
daddi $t2, $0, 4
sd $t2, 0($s1)

fin: halt

