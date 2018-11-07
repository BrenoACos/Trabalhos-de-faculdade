# h = A [ i ] ;
# A[ i ] = A [ i + 1] ;
# A [ i + 1] = h ;

# h = $s0
# i = $s1
# A[i] = $s2
# A[i+1] = $s3
.text
.globl main
main:

addi $t0, $0, 0x1001 	# t0 = 0x1001
sll $t0, $t0, 16	# t0 = 0x10010000 considerando que o início do arranjo esteja nesta posição
sll $t1, $s1, 2		# t1 = i*4 para obter a posição equivalente de i no arranjo em MIPS
add $t2, $t1, $t0	# t2 = ponteiro para a posição i do arranjo
lw $s2 = 0($t2)		# s2 = A[i]
addi $s0, $0, $s2	# h = A[i]
lw $s3 = 4($t2)		# s3 = A[i+1]
addi $s2, $0, $s3	# A[i] = A[i+1]
sw $s2, 0($t2)		# armazena na memória o novo valor de A[i]
addi $s3, $0, $s0	# A[i+1] = h
sw $s3, 4($t2)		# armazena na memória o novo valor de A[i+1]


