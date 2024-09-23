PIC EQU 21H
HANDSHAKE equ 41h

org 20
dirHandShake dw subrutHandShake

org 1000h
mensaje db "UNIVERSIDAD NACIONAL DE LA PLATA"
finMensaje db ?

org 3000h
configPic:
mov al, 0fbh
out pic, al
mov al, 5
out pic+5, al
ret

subrutHandShake:
mov al, [bx]
out handshake-1, al
inc bx
dec cl
jnz finInt
mov al, 0ffh
out pic, al
mov dl, 1
finInt: mov al, 20h
out 20h, al
iret

org 2000h
cli
mov al, 0ffh
mov dl, 0
out handshake, al
call configPic
mov bx, offset mensaje
mov cl, offset finMensaje - offset mensaje
sti
loopInf: 
cmp dl, 1
jz fin
jmp loopInf
fin: int 0
end
