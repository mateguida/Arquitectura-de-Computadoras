.data
numA: .word 8
numB: .word 12
resS: .word 0
resP: .word 0
resD: .word 0

.code
LW R1, numA(R0)
LW R2, numB(R0)
DADD R3, R1, R2
SW R3, resS(R0)

DMUL R3, R1, R2
DADDI R3, R3, 2
SW R3, resP(R0)

DMUL R3, R1, R1
DDIV R3, R3, R2
SW R3, resD(R0)

HALT