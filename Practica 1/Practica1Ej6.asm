ORG 1000H
MSJ DB "INGRESE UN NUMERO:"
FIN DB ?

ORG 1500H
NUM DB ?

ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN-OFFSET MSJ
INT 7
MOV BX, OFFSET NUM
INT 6
MOV AL, 1
INT 7
MOV CL, NUM
INT 0
END

;a) Con referencia a la interrupción INT 6, ¿qué se almacena en BX?
    ; Previo a la ejecucion del int 6, se guarda en BX la direccion de memoria donde se guardara el caracter ingresado
;b) En el programa anterior, ¿qué hace la segunda interrupción INT 7?
    ; La segunda interrupcion INT 7 imprimira unicamente 1 caracter que se encuentra referido por BX, es decir el que fue ingreasado
;c) ¿Qué valor queda almacenado en el registro CL? ¿Es el mismo que el valor numérico ingresado?
    ; en CL quedara ingresado el valor hexadecimal del caracter ingresado por teclado.
