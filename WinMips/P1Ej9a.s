.data
string: .asciiz "ArquiTectuRa de ComPutaDoras"
longiutd: .word 0

.code
daddi $t1, $zero, string
loop: lb $t3, 0($t1) 
daddi $s1, $s1, 1
daddi $t1, $t1, 1
bnez $t3, loop
sd $t1, longiutd($zero)
halt