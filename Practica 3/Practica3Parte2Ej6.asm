PIC EQU 21H
COMP EQU 11H

org 20
dirIntF10 dw subrutF10

org 40
dirIntTimer dw subrutTimer

org 3000h
subrutF10:
mov al, 0fdh
out pic, al
mov al, 10
out pic+4, al
mov cl, valorIngresado
in al, 10h
add al, 3
out comp, al
mov al, 20h
out 20h, al
iret

subrutTimer:
mov bx, offset valorIngresado
mov al, 1
int 7
in al, comp
add al , 1
out comp, al
dec valorIngresado
mov al, 20h
out 20h, al
iret

org 1000h
mensajeIngrese db "Ingrese un valor para el conteo"
finMensajeIngrese db ?
valorIngresado db ?

org 2000h
cli
mov al, 0feh
out pic, al
mov al, 5
out pic+3, al
mov bx, offset mensajeIngrese
mov al, offset finMensajeIngrese - offset mensajeIngrese
int 7
mov bx, offset valorIngresado
int 6
sti
loopInf: 
cmp valorIngresado, 2fh
jz fin
jmp loopInf
fin: int 0
end
