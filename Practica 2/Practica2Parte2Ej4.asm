;a) Imprimir letra fija Escribir un programa para imprimir la letra “A” utilizando la impresora a través de
;la PIO. Recordar que el programa deberá esperar hasta que el bit de busy esté apagado, luego enviar el
;carácter, y luego enviar el flanco ascendente a través de la señal de strobe. Modularizar el programa en
;4 subrutinas:
;📄 ini_pio: Inicializa el PIO configurando los registros CA y CB según corresponde a strobe, busy y
;puerto de datos
;📄 poll: Consulta el bit busy de la impresora, e itera hasta esté en 0. Cuando está en 0 la subrutina
;retorna sin devolver ninǵun valor
;📄 flanco_ascendente: Igual que la subrutina implementada en el ejercicio anterior
;📄 imprimir_caracter: Recibe un carácter a imprimir en AL, y utilizando poll y flanco_ascendente,
;realiza todos los pasos necesarios para enviar a la impresora el carácter.

PA EQU 30h
CA EQU 32H
PB EQU 31H
CB EQU 33H

org 1000h
caracter db 'A'

org 2000h
call ini_pio
mov bl, caracter
call imprimir_caracter
int 0

org 3000h ; subrutinas
ini_pio: 
mov al, 11111101b
out CA, al
mov al, 0
out cb, al
ret

poll:
in al, pa
and al, 1
jnz poll
ret

flanco_ascendente:
in al, pa
or al, 2
out pa, al
in al, pa
and al, 11111101b
out pa, al
ret

imprimir_caracter:
call poll
mov al, bl
out pb, al
call flanco_ascendente
ret

end
