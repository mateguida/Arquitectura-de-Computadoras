.data
colorAzul: .byte 0, 0, 255, 0
colorRojo: .byte 255, 0, 0, 0
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $s0 , CONTROL($0)
ld $s1 , DATA($0)
daddi $t1, $0, 25
daddi $a0, $0, 0

loop: lw $a1, colorAzul($0)
lw $a2, colorRojo($0)
jal filaAlternativa

daddi $a0, $a0, 1
lw $a1, colorRojo($0)
lw $a2, colorAzul($0)
jal filaAlternativa

daddi $a0, $a0, 1
daddi $t1, $t1, -1
bnez $t1, loop

halt

filaAlternativa: daddi $t8, $0, 25
daddi $t9, $0, 0
loop2: sw $a2, 0($s1)
sb $a0, 5($s1)
sb $t9, 4($s1)
daddi $t7, $0, 5
sd $t7, 0($s0)

daddi $t9, $t9, 1
sw $a1, 0($s1)
sb $a0, 5($s1)
sb $t9, 4($s1)
daddi $t7, $0, 5
sd $t7, 0($s0)
daddi $t9, $t9, 1

daddi $t8, $t8, -1
bnez $t8, loop2
jr $ra