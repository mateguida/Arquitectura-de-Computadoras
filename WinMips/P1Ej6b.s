.data
V: .word 3, 5, 6

.code
daddi r2, r0, 3
loop: ld r3, V(r1)
daddi r2, r2, -1
dadd r4, r4, r3
daddi r1, r1, 8
bnez r2, loop
halt