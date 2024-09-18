; 📄 A_MINUS ⭐ Recibe un carácter mayúscula en AL y lo devuelve como minúscula.
org 1000h
caracter db 'J'

org 2000h
mov al, caracter
call a_minus
int 0

org 3000h
a_minus: 
add al, 20h
ret

end
