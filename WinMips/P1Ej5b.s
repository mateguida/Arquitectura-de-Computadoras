.data
A: .word 9
B: .word 8
C: .word 0

.code
LW R1, A(R0)
BEQZ R1, Aes0
LW R2, B(R0)
SLT R3, R2, R1
BEQZ R3, Besmayor
DADDI R4, R4, 2
DMUL R1, R1, R4
SW R1, C(R0)
J FIN

Besmayor: SW R2, C(R0)
J FIN

Aes0: SW R0, C(R0)
J FIN

FIN: HALT