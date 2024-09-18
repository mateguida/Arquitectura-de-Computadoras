;inciso a

PIC EQU 21H

org 20
dirTimer dw subrutTimer

org 1000h
mensaje db "Vamos las interrupciones!"
finMsj db ? 

org 2000h
cli
call configPIC
sti
mov al, 2
out 11h, al
loop:jmp loop
int 0 

org 3000h
configPIC: 
mov al, 11111101b
out pic, al
mov al, 5
out pic+4, al
ret

subrutTimer:
mov bx, offset mensaje
mov al, offset finmsj - offset mensaje
int 7
in al, 11h
add al, 2
out 11h, al
mov al, 20h
out 20h, al
iret

end

; inciso b

PIC EQU 21H

org 20
dirTimer dw subrutTimer

org 1000h
mensaje db "Vamos las interrupciones!"
finMsj db ? 

org 2000h
mov dl, 0
cli
call configPIC
sti
mov al, 2
out 11h, al
loop:
cmp dl, 5
jz fin
jmp loop
fin: int 0 

org 3000h
configPIC: 
mov al, 11111101b
out pic, al
mov al, 5
out pic+4, al
ret

subrutTimer:
mov bx, offset mensaje
mov al, offset finmsj - offset mensaje
int 7
inc dl
in al, 11h
add al, 2
out 11h, al
mov al, 20h
out 20h, al
iret

end

; inciso c

PIC EQU 21H

org 20
dirTimer dw subrutTimer

org 1000h
mensaje db "Vamos las interrupciones!"
finMsj db ? 

org 2000h
mov dl, 0
cli
call configPIC
sti
mov al, 0ah
out 11h, al
loop:
cmp dl, 1
jz fin
jmp loop
fin: int 0 

org 3000h
configPIC: 
mov al, 11111101b
out pic, al
mov al, 5
out pic+4, al
ret

subrutTimer:
mov bx, offset mensaje
mov al, offset finmsj - offset mensaje
int 7
inc dl
mov al, 20h
out 20h, al
iret

end
