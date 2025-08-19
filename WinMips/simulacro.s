.code
daddi $t1, $0, 20
loop: daddi $t1, $t1, -1
ddiv $t1, $t1, $t1
halt
