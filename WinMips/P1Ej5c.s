.data
F: .word 1
N: .word 9

.code
LW R1, N(R0)
LW R2, F(R0)
FOR: BEQZ R1, FIN
DMUL R2, R2, R1
DADDI R1, R1, -1
J FOR
FIN: SW R2, F(R0)
HALT
