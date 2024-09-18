; � ES_MAYUS ⭐ Recibe un carácter en el registro AL y retorna en AH el valor 0FFh si es
; mayúscula y 0 de lo contrario.

org 1000h
caracter db 'ñ'

org 2000h
mov al, caracter
call esMayus
int 0

org 3000h
esMayus: 
CMP al, 40h
js minuscula
cmp al, 5bh
jns minuscula
mov ah, 0FFh
JMP finSubrut
minuscula:
mov ah, 0
finSubrut: ret
end
