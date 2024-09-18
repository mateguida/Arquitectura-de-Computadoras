; � CONTAR_CAR ⭐ Recibe la dirección de comienzo de un string en BX, su longitud en AL, y el
; carácter a contar en AH. Retorna en CL la cantidad de veces que aparece el carácter

org 1000h
palabra db "Anda joya"
finPalabra db ?
caracterAContar db 'a'

org 3000h
contar_Car: 
cmp ah, [bx]
jnz noCoinciden
inc cl
noCoinciden: dec al
jz finSubrut
inc bx
jmp contar_Car
finSubrut: ret

org 2000h
mov bx, offset palabra
mov al, offset finPalabra - offset palabra
mov ah, caracterAContar
mov cl, 0
call contar_Car
int 0
end
