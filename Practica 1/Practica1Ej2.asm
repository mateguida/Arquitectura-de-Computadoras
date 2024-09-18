;Escribir un programa que determine si un carácter (un string de longitud 1) es una
;letra mayúscula. El carácter está almacenado en la variable C, y el resultado se guarda en la variable
;RES de 8 bits. Si C es mayúscula, debe almacenarse el valor 0FFh en RES; de lo contrario, debe
;almacenarse 0. Pista: Los códigos de las mayúsculas son todos consecutivos. Buscar en la tabla ASCII
;los caracteres mayúscula, y observar qué valores ASCII tienen la ‘A’ y la ‘Z’.

org 1000h
CARACTER DB 'b'
RES DB ? 

ORG 2000H
MOV BL, 40H
CMP BL, CARACTER ; COMPARO EL CARACTER PARA SABER SI ESTA ENTRE LOS RANGOS DE LETRAS MAYUSCULAS(40 - 5B)
JS COMPARACION2; SI LA RESTA ES NEGATIVA, EL CARACTER SERA ANTERIOR A LAS LETRAS MAYUSCULAS, POR ENDE YA NO CUMPLE
JMP almacenarCero
COMPARACION2: MOV BL, 5BH
CMP BL, CARACTER
JNS esMayus
JMP almacenarCero ; SI YA NO CUNMPLE, ALMACENO 0 EN RES
esMayus: MOV RES, 0FFH ; ALMACENO FF EN EL RES
JMP FIN ; VOY AL FIN DEL PROGRAMA
almacenarCero: MOV RES, 0H ; ALMACENO 0 EN EL RES
FIN: hlt ; FINAL DEL PROGRAMA
end
