.data
cadMsg: .asciiz "Cadena con reemplazos!"
mayuMsg: .asciiz "Letras convertidas a mayusculas"
cadena: .asciiz "Cadena <-enTRADa->"
mayu: .asciiz ""
cantCaracteres: .word 18
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
;Progama principal
ld $s6, CONTROL($0)
ld $s7, DATA($0)
daddi $sp, $sp, 0x400
daddi $a0, $0, cadena
daddi $a1, $0, mayu
jal procesarCadena

daddi $a0, $0, cadMsg
daddi $a1, $0, cadena
jal imprimir

daddi $a0, $0, mayuMsg
daddi $a1, $0, mayu
jal imprimir

halt

;Procesar Cadena
procesarCadena: daddi $sp, $sp, -8
sd $ra, 0($sp) ; guarda la direccion de retorno de procesar cadena en la pila 

dadd $s0, $0, $a0 ; direccion de cadena
dadd $s1, $0, $a1 ;direccion de cadena mayu
ld $s2, cantCaracteres($0) ; guardo la cant de caracteres

loop: lbu $a2, 0($s0) ; carga el caracter en a2 para pasarlo como parametro a esMinu
jal esMinu
bnez $v0, pasarMayus
j seguir
pasarMayus: jal obtenerMayus
sb $v0, 0($s0) ;guardo el caracter en el lugar que habia la minuscula
sb $v0, 0($s1) ;guardo el caracter en la cadena nueva mayu
daddi $s1, $s1, 1
seguir: daddi $s2, $s2, -1 ;decremento cantidad de caracteres
daddi $s0, $s0, 1 ; incremento s0 para pasar al sig caracter
bnez $s2, loop
ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

;Es Minu
esMinu: slti $t1, $a2, 0x61
bnez $t1, esMayus
slti $t1, $a2, 0x7A
beqz $t1, esMayus
daddi $v0, $0, 1
j fin
esMayus: daddi $v0, $0, 0
fin: jr $ra

;Obtener Mayu
obtenerMayus: dadd $t2, $0, $a2
daddi $t2, $t2, -0x20
dadd $v0, $0, $t2
jr $ra

;Imprimir
imprimir: sd $a0, 0($s7) ; mando direccion de mensaje que entra por parametro a data
daddi $t8, $0, 4
sd $t8, 0($s6) ; mando 4 a control para imprimir cadena

sd $a1, 0($s7) ; mando direccion de mensaje que entra por parametro a data
daddi $t8, $0, 4
sd $t8, 0($s6) ; mando 4 a control para imprimir cadena
jr $ra