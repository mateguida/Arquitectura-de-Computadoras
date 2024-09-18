parte 4:
Juego de Luces con Rotaciones⭐⭐⭐

;Escribir un programa que encienda una luz a la vez, de las ocho conectadas al puerto paralelo del
;microprocesador a través de la PIO, en el siguiente orden de bits:
;0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-..., es decir, 00000001, 00000010,
;00000100, etc. El programa nunca termina. Para ello, deberá utilizar las subrutinas ROTAR_IZQ y
;ROTAR_DER_N, que le permitirán rotar el bit de estado de las luces y generar el juego
;correspondiente.
PB EQU 31H
CB EQU 33H
ORG 3000H
ROTAR_IZQ:
  ADD AL, AL
  RET
ROTAR_DER:
  MOV DL, 7
  LOOPCITO:ADD AL, AL
  JC CARRY1
  JMP FIN
  CARRY1: ADD AL, 1
  FIN:DEC DL
  JNZ LOOPCITO
  RET
ORG 2000H
  ;CONFIGURO CB TODOS DE SALIDA
  MOV AL, 00000000B
  OUT CB, AL
  ;CONFIGURO ESTADO INICIAL
  MOV AL, 00000001B
  MOV CL, 7
  LOOP:OUT PB, AL
  CALL ROTAR_IZQ
  DEC CL
  JNZ LOOP
  MOV CL, 7
  LOOP2:OUT PB,AL 
  CALL ROTAR_DER
  DEC CL
  JNZ LOOP2
  MOV CL,7
  JMP LOOP
INT 0 
END


2) CriptoLlaves (Llaves, Luces):⭐⭐⭐

;2) CriptoLlaves (Llaves, Luces):⭐⭐⭐
;Escriba un programa de VonSim que permita jugar al CriptoLlaves. El usuario debe adivinar un patrón secreto
;de 8 bits que está almacenado en la memoria del programa. Para ello, debe manipular las llaves hasta que el
;patrón de bits de las llaves sea exactamente igual al del patrón secreto. Como ayuda para el usuario, si el estado
;de una llave acierta al bit correspondiente, el programa debe prender el led correspondiente. Por ejemplo, si el
;patrón es 0100 0101 y las llaves están en el estado 1110 0100, deben prenderse las luces de los bits 1, 2, 3, 4 y 6.
;Como no acertó a todos los bits, el usuario no ha adivinado el patrón y debe continuar jugando.
;El programa termina cuando el usuario acierta todos los bits del patrón, mostrando en pantalla el mensaje
;"GANASTE".
PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H
ORG 1000H
PATRON DB 11001100B
MENSAJE DB "ganaste"
finmsj db ?
ORG 2000H
  ;CONFIGURACION CA
  MOV AL, 11111111B
  OUT CA, AL
  ;CONFIGURACION CB
  MOV AL, 00000000B
  OUT CB, AL
  MOV BX, OFFSET PATRON
  OUT PB, AL
  PATRONINCORRECTO:IN AL, PA
  CMP BYTE PTR[BX], AL
  JZ PATRON_CORRECTO
  XOR AL, PATRON
  NOT AL
  OUT PB, AL
  JMP PATRONINCORRECTO
  
  PATRON_CORRECTO:
  OUT PB, AL
  mov bx, OFFSET MENSAJE
  mov al, OFFSET finmsj - OFFSET MENSAJE
  
  int 7

INT 0
END

;3) Llaves y mensajes⭐⭐
;a) Escribir un programa que continuamente verifique el estado de las llaves. Si están prendidas la
;primera y la última llave, y el resto están apagadas (patrón 10000001), se debe mostrar en pantalla el
;mensaje "ACTIVADO". En caso contrario, no se debe mostrar nada.
;b) Modificar a) para que el mensaje se imprima una sola vez cada vez que detecte ese patrón de bits. Por
;ejemplo, si el programa lee la siguiente secuencia de patrones:
;00010101 → 10010000 → 10000001 → 10000001 → 10000001 → 10010001 → 10000001 →
;10000001 → 10010101 → 01110001
;Entonces solo deberá imprimir “ACTIVADO” dos veces.
PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H

  VACIO DB 12
  PATRON DB 10000001B
  MENSAJE DB "ACTIVADO"
  FINMSJ DB ?

ORG 2000H
;CONFIGURO CA
MOV AL, 11111111B
OUT CA, AL

;MUEVO EL PATRON AL REGISTRO BX
LOOP:MOV BX, OFFSET PATRON
;TRAIGO EL ESTADO DE LAS LLAVES
IN AL, PA
CMP AL, DL
JZ LOOP
MOV DL, AL
;COMPARO LAS LLAVES
CMP [BX], AL
JZ ACTIVADO
JMP VACIAR
ACTIVADO: MOV AL, OFFSET FINMSJ - OFFSET PATRON
INT 7
JMP LOOP
VACIAR: MOV BX, OFFSET VACIO
MOV AL,1
INT 7
JMP LOOP
INT 0
END
