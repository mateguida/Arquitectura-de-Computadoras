.data
V: .word 3, 5, 6

.code
ld r2, V(r1)
daddi r1, r1, 8
ld r3, V(r1)
daddi r1, r1, 8
ld r4, V(r1)
dadd r2, r2, r3
dadd r2, r2, r4
halt