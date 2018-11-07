# h = k + A [ i ] ;
# h = $s0
# k = $s1
# i = $s2
# A [i] = $s3
.text
.globl main
main:

addi $t0, $0, 0x1001 	# t0 = 1001
sll $t0, $t0, 16     	# t0 = 10010000 considerando que o início do arranjo esteja em 0x10010000
sll $t1, $s2, 2         # t2 = 4*i para marcar a posição "i" no arranjo em MIPS
add $t2, $t1, $t0	# t3 = t2 + t1, para marcar a posição de memória onde está o A[i] em relação à posição 0 do arranjo
lw $s3, 0($t1)          # s3 = A [i]
add $s0, $s1, $s3       # h = k + A[i]

