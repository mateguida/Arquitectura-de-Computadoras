.data
vector: .word 12, -1, 43, 1, -6, 9,-8, -44, 98, -66
pos: .word 0

.code
daddi r2, r0, 10
daddi r1, r0, vector
loop: ld r3, 0(r1)
daddi r2, r2, -1
daddi r1, r1, 8
slt r4, r3, r0
beqz r4, negativo
daddi r5, r5, 1
negativo: bnez r2, loop
sd r5, pos(r0)
halt