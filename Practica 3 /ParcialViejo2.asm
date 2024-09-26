; Escribir un programa para VonSim que muestre el mensaje "Escriba 5 caracteres:", después lea un texto de 5
; caracteres y lo almacene en memoria. Luego, el texto leído debe ser enviado a una subrutina llamada "SUB_IMP"
; por referencia a través de la pila. La subrutina debe mostrar eI texto en pantalla de a I carácter por segundo
; (utilizando ei TIMER).

cont equ 10h
comp equ 11h
imr equ 21h
int1 equ 25h

org 20
dirTimer dw interrupcionTimer

org 1000h
mensaje db "Escriba 5 caracteres: "
finMsj db ?
texto db ?
longitudTexto db 5

org 3000h
sub_imp:
mov bx, sp
add bx, 2
mov ax, [bx]
mov bx, ax

mov al, 1
out comp, al
mov al, 0
out cont, al

mov ch, 5
mov dl, 0
sti

loop:
cmp dl, 1
jz fin
jmp loop

fin: ret

interrupcionTimer:
mov al, 1
int 7
inc bx
dec ch
jnz finSb
mov dl, 1
finSb:mov al, 0
out cont, al
mov al, 20h
out 20h, al
iret

org 2000h
cli
mov al, 11111101b
out imr, al
mov al, 5
out int1, al
; configuro pic

mov bx, offset mensaje
mov al, offset finMsj - offset mensaje
int 7

mov cl, longitudTexto
mov bx, offset texto
loop1: 
int 6
inc bx
dec cl
jnz loop1

mov ax, offset texto
push ax
call sub_imp
int 0

end
