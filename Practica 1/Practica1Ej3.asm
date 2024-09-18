org 1000h
caracter db 'J'

org 2000h
mov al, caracter
add al, 20h
mov caracter, al
hlt
end
