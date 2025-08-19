.data
CONTROL: .word 0x10000
DATA: .word 0x10008
color: .byte 0, 0, 255, 0

.code
ld $s1, CONTROL($zero)
ld $s2, DATA($zero)
ld $s3, color($zero)

daddi $s4, $0, 0
daddi $s5, $0, 0

daddi $t2, $0, 50
loop: sw $s3, 0($s2)
sb $s4, 5($s2)
sb $s5, 4($s2)
daddi $s5, $s5, 1
daddi $t1, $zero, 5
sd $t1, 0($s1)
bne $s5, $t2, loop
halt
