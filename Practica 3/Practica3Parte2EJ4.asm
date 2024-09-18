PIC EQU 21H

org 20
dirF10 dw subrutF10

org 1000h
mensaje db "Vamos las interrupciones!"
finMsj db ? 

org 2000h
cli
call configPIC
sti
loop: jmp loop
int 0 

org 3000h
configPIC: 
mov al, 0feh
out pic, al
mov al, 5
out pic+3, al
ret

subrutF10:
mov bx, offset mensaje
mov al, offset finmsj - offset mensaje
int 7
mov al, 20h
out 20h, al
iret

end


;INCISO B


PIC EQU 21H

org 20
dirF10 dw subrutF10

org 1000h
mensaje db "Vamos las interrupciones!"
finMsj db ? 

org 2000h
mov dx, 0
cli
call configPIC
sti
loop:
cmp dl, 5
jz deshabilitar
jmp loop
deshabilitar: cli
int 0 

org 3000h
configPIC: 
mov al, 0feh
out pic, al
mov al, 5
out pic+3, al
ret

subrutF10:
mov bx, offset mensaje
mov al, offset finmsj - offset mensaje
int 7
inc dl
mov al, 20h
out 20h, al
iret

end
