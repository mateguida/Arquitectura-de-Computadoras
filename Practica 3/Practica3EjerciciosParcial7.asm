; Dispositivo nuevo con PIO ⭐⭐⭐ Escribir un programa para VonSim que envíe la cadena de caracteres
; ; “Hola!” a un dispositivo nuevo, conectado a los 8 bits del puerto PB. Este dispositivo recibe la cadena de a un
; ; carácter a la vez, esperando 5 segundos entre cada carácter. Para indicar al dispositivo que finalizó el envío
; ; de datos, se debe enviar el código ascii 0 luego de enviar todos los carácteres del string. El programa debe
; ; finalizar cuando se han enviado todos los caracteres de la cadena, o cuando se presiona la tecla F10,
; ; cancelando el envío cancelando el envío de los caracteres que restan.
PB equ 31h
CB EQU 33H
PIC equ 21h
EOI equ 20h
COMP EQU 11H
CONT EQU 10H

ORG 20
DIRF10 DW SUBRUTF10

ORG 40
DIRTIMER DW SUBRUTTIMER

ORG 3000H
; SUBRUTINA DE CONFIGURACION DEL PIC
CONFIG_PIC:
MOV AL, 11111100b ; MASCARA DE INTERRUPCIONES
OUT PIC, AL
MOV AL, 5
OUT PIC+3, AL ; ID DEL VECTOR DE INTERRUPCIONES F10
MOV AL, 10
OUT PIC+4, AL ;  ID DEL VECTOR DE INTERRUPCIONES TIMER
RET

SUBRUTF10:
MOV DL, 0FFH
MOV AL, 20H
OUT EOI, AL
IRET

SUBRUTTIMER:
MOV AL, [BX]
OUT PB, AL
MOV AL, 0
OUT CONT, AL
INC BX
DEC CL
JNZ FINSUBRUT
MOV AL, 0FFH
OUT PIC, AL
MOV DL, 0FFH
MOV AL, 30H
OUT PB, AL ; IMPRIMO EL 0 EN ASCII
; SALTO LA FLAG PORQUE SE TEMINARON LOS CARACTERES
FINSUBRUT: MOV AL, 20H
OUT EOI, AL
IRET

ORG 1000H
MENSAJE DB "Hola!"
FINMENSAJE DB ?

ORG 2000H
CLI
MOV DL, 0 ; INICIALIZO LA FLAG MANUAL
CALL CONFIG_PIC
MOV AL, 0
OUT CB, AL ; CONFIGURO TODAS LAS LUCES DE SALIDA
MOV BX, OFFSET MENSAJE
MOV CL, OFFSET FINMENSAJE - OFFSET MENSAJE
MOV AL, 5
OUT COMP, AL
MOV AL, 0
OUT CONT, AL
STI
LOOP: CMP DL, 0FFH
JZ FIN
JMP LOOP
FIN: INT 0
end
