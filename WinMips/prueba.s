.code
daddi $t1, $0, 3    ; if | id | ex | mem | wb
loop: daddi $t1, $t1, -1  ;      if | id | raw | raw | ex | mem | wb |
sd $t1, 45($0)      ;           if | raw | raw | raw | raw | id | ex | mem | wb 
bnez $t1, loop
halt