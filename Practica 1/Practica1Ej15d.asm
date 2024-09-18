; 📄 STRING_A_MINUS ⭐⭐ Recibe la dirección de comienzo de un string en BX, su longitud en
; AL. Recorre el string, cambiando a minúscula las letras que sean mayúsculas. No retorna nada, sino
; que modifica el string directamente en la memoria.

org 1000h
string db "PRUEBA"
fString db ? 

org 2000h
mov bx, offset string
mov al, offset fString - offset string
call string_A_Minus
int 0

org 3000h
string_A_Minus:
CMP byte ptr[bx], 40h
js minuscula
cmp byte ptr[bx], 5bh
jns minuscula
add byte ptr[bx], 20h
dec al
jz finSubrut
inc bx
JMP string_A_minus
minuscula:
dec al
jz finSubrut
inc bx
jmp string_A_minus
finSubrut: ret
end
