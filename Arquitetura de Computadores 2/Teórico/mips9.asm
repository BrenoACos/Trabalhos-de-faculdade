# A [ j ] = h + A [ i ] 
# h = $s0
# i = $s1
# j = $s2
# A [i] = $s3
# A [j] = $s4
.text
.globl main
main:

addi $t0, $0, 0x1001 	# t0 = 1001
sll $t0, $t0, 16     	# t0 = 10010000,  considerando que o início do arranjo esteja em 0x10010000
sll $t1, $s1, 2         # t1 = 4*i para marcar a posição "i" no arranjo em MIPS
sll $t2, $s2, 2		# t2 = 4*j para marcar a posição "j" no arranjo em MIPS
add $t3, $t1, $t0	# t3 = t1 + t0, para marcar a posição de memória onde está o A[i] em relação à posição 0 do arranjo
add $t4, $t2, $t0	# t4 = t2 + t0, para marcar a posição de memória onde está o A[j] em relação à posição 0 do arranjo
lw $s3, 0($t3)          # s3 = A [i]
add $t5, $s0, $s3	# t5 = h + A[i]
sw $s4, 0($t4)		# A[j] = h + A[i]

