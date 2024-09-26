;9. Escribir un programa para MSX88 que envie una serie de códigos ASCII hacia un
;dispositivo extemo, a través del puerto PA del PIO. Los datos, que están almacenados en la
;memoria del procesador a partir de la celda CÓDIGO, se deben enviar al puerto PA en
;forma sincronizada utilizando la interrupción del TIMER, de tal manera que se transmita un
;carácter ASCII segundo, EI programa debe frtalizar una vez transferidos todos 106
;caracteres. (10 pts)


CONT EQU 10H
COMP EQU 11H
EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H
PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 20
DIRTIMER DW SUBRUTIMER

ORG 1000H
CODIGO DB "DJHOSIFUOJNSGSLJK34857783479DFIGHDFKJjcviehfkgbfgi38494KF94R4OFJLSPNWE3434"
FIN DB ?

ORG 3000H
SUBRUTIMER:
mov al, [bx]
out pa, al
inc bx
dec cl
jnz continuar
mov dl, 0ffh
continuar: mov al, 0
out cont, al
mov al, 20h
out 20h, al
iret

CONFIGPIC:
MOV AL, 11111101B
OUT IMR, AL
MOV AL, 5
OUT INT1, AL
RET

ORG 2000H
CLI
CALL CONFIGPIC
MOV AL, 0
OUT CA, AL

mov al, 1
out comp, al
mov al, 0
out cont, al

mov bx, offset codigo
mov cl, offset fin - offset codigo

mov dl, 0
sti

loop: cmp dl, 0ffh
jz finPrograma
jmp loop
finPrograma: int 0

end
