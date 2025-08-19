.data
V: .word 3, 5, 6
F: .word -1

.code
daddi r1, r0, V
daddi r2, r0, 3
loop: daddi r2, r2, -1
ld r4, 0(r1)
dadd r3, r3, r4
daddi r1, r1, 8
bnez r2, loop
halt