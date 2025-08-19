.data
N: .word 62
L: .word 0

.code
LW R1, N(R0)
DADDI R2, R2, 2
WHILE: BEQZ R1, FIN
DDIV R1, R1, R2
DADDI R3, R3, 1
J WHILE

FIN: SW R3, L(R0)
HALT