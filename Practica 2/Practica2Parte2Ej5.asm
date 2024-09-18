HANDSHAKE EQU 41H
DATA EQU 40H

ORG 1000H
mensaje db "INGENIERIA E INFORMATICA"
finMensaje db ? 

ORG 2000H
call configurarHand
mov bx, offset mensaje
mov cl, offset finMensaje - offset mensaje
polling: in al, handshake
and al, 1 ; mascara 0000000X
jnz polling
call imprimirCaracter
jnz polling
int 0

ORG 3000H
configurarHand:
in al, handshake
and al , 7fh
out handshake, al
ret

imprimirCaracter:
mov al, [bx]
out data, al
inc bx
dec cl
ret

end
