;Escribir un programa que solicite el ingreso de una contraseña de 4
;caracteres por teclado, sin visualizarla en pantalla. En caso de coincidir con una clave predefinida (y
;guardada en memoria) que muestre el mensaje "Acceso permitido"; caso contrario mostrar el mensaje
;"Acceso denegado", y volver a pedir que se ingrese una contraseña. Al 5to intento fallido, debe mostrarse el
;mensaje “Acceso BLOQUEADO” y terminar el programa.

org 1000h
mensajeIngrese db "Ingrese su contraseña"
finMensajeIngrese db ?
mensajeAccesoP db "Acceso permitido"
finMensajeAccesoP db ?
mensajeAccesoD db "Acceso denegado"
finMensajeAccesoD db ?
mensajeAccesoB db "Acceso BLOQUEADO"
finMensajeAccesoB db ?
contrasenaDefinida db "kkkk"
limpiarPantalla db 12
inicioContrasena db ? ; 104Ch


org 2000h
MOV CH, 0
ingresarContrasena: MOV AL, OFFSET finMensajeIngrese - offset mensajeIngrese
MOV BX, OFFSET mensajeIngrese
INT 7
MOV BX, OFFSET inicioContrasena
MOV CL, 4
bucleContrasena: INT 6
INC BX
DEC CL
JNZ bucleContrasena 
;YA FUE INGRESADA LA CONTRASEÑA

MOV AX, 0000H
MOV CL, 4
continuarComparando: MOV BX, OFFSET contrasenaDefinida
ADD BX, AX
MOV DL, [BX]
MOV BX, OFFSET inicioContrasena
ADD BX, AX
MOV DH, [BX]
CMP DL, DH
JZ coinciden
JMP falloContrasena
coinciden: INC AX
DEC CL
JNZ continuarComparando

;la contraseña es correcta
MOV BX, offset limpiarPantalla
MOV AL, 1
INT 7
MOV AL, OFFSET finMensajeAccesoP - offset mensajeAccesoP
MOV BX, OFFSET mensajeAccesoP
INT 7
JMP FIN

falloContrasena: ;hacer el codigo de fallo
MOV BX, offset limpiarPantalla
MOV AL, 1
INT 7
MOV AL, OFFSET finMensajeAccesoD - offset mensajeAccesoD
MOV BX, OFFSET mensajeAccesoD
INT 7
INC CH
CMP CH, 5
JZ accesoBloqueado
MOV BX, offset limpiarPantalla
MOV AL, 1
INT 7
JMP ingresarContrasena

;ha hecho 5 intentos fallidos
accesoBloqueado: 
MOV BX, offset limpiarPantalla
MOV AL, 1
INT 7
MOV AL, OFFSET finMensajeAccesoB - offset mensajeAccesoB
MOV BX, OFFSET mensajeAccesoB
INT 7

FIN: int 0
end
