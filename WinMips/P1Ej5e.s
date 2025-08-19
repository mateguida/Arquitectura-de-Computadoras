.data
a: .word 8
b: .word 999

.code
LW R1, a(R0)
ANDI R2, R1, 1
BEQZ R2, ESPAR
SW R0, b(R0)
J FIN

ESPAR: DADDI R3, R3, 1
SW R3, b(R0)

FIN: HALT