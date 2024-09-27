; F10, impresora con HS y dígitos ⭐⭐⭐ 
; Escribir un programa para imprimir en la impresora un conteo
; regresivo en base a un dígito ingresado por teclado. Por ejemplo, si el usuario ingresa “3”, se debe imprimir
; “3 2 1 0”. El programa comienza leyendo un carácter dígito con la subrutina 📄 LEER_DIGITO. Luego espera
; a que el usuario presione F10 para comenzar la impresión, y llama a la subrutina 📄 DESCENDER que la
; implementa. 📄 LEER_DIGITO muestra en pantalla el mensaje “INGRESE UN NUMERO DEL 1 AL 9:” y lee un
; carácter de teclado. Si el carácter ingresado no corresponde al número solicitado, se debe volver a leer un
; carácter hasta que el usuario ingrese efectivamente un número del 1 al 9.
;📄 DESCENDER recibe el dígito por valor y por la pila, y envía a la impresora en forma descendente
; desde el número ingresado hasta el “0”, utilizando el Handshake por Consulta de Estado.

IMR EQU 21H
INT0 EQU 24H
ESTADO EQU 41H
DATOS EQU 40H
EOI EQU 20H

org 20
dirF10 dw IntF10

ORG 1000H
mensaje db "INGRESE UN NUMERO DEL 1 AL 9: "
finMensaje db ?
numeroIngresado db ?

org 3000h
leerDigito:
mov bx, offset mensaje
mov al, offset finMensaje - offset mensaje
int 7

mov bx, offset numeroIngresado
int 6

cmp byte ptr[bx], 30h
js leerDigito
cmp byte ptr[bx], 3ah
jns leerDigito
ret

descender:
mov bx, sp
add bx, 2 ;7ffc
mov cl, [bx]
polling: 
in al, estado
and al, 1
jnz polling
mov al, cl
out datos, al
dec cl
cmp cl, 2fh
jnz polling
ret

intF10:
mov dl, 1
mov al, 20h
out 20h, al
iret

org 2000h
cli
mov al, 0feh
out imr, al
mov al, 5
out int0, al
;configure pic

mov al, 7Ch ; 01111100
out estado, al
;configure handshake
mov dl, 0
;inicializo flag manual

call leerDigito
sti

esperarAF10:cmp dl, 1
jz continuar
jmp esperarAF10

continuar:
mov cl, numeroIngresado
push cx
call descender
int 0

END
