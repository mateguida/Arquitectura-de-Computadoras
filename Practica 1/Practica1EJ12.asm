org 3000h
rut: mov bx,3 ; SP = 7FFEH 
ret ; SP = 8000H ; DESAPILA LA DIRECCION DE LA LLAMADA A LA SUBRUTINA Y VUELVE A LINEA 7

org 2000h
call rut ; SP = 7FFEH ; SE GUARDARA EN PILA LA DIRECCION DE ESTA INSTRUCCION PARA RETORNAR AL CODIGO PRINCIPAL
add cx,5 ; SP = 8000H ; NO SE AGREGA NADA A LA PILA
call rut ; SP = 7FFEH ; SE GUARDARA EN PILA LA DIRECCION DE ESTA INSTRUCCION PARA RETORNAR AL CODIGO PRINCIPAL
hlt ; SP = 8000H
end
