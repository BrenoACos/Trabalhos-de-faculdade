
.text
.globl main
main:

lui $s0, 0x1001
addi $s1, $0, 100

add $a0, $s0, $0
add $a1, $s1, $0
jal vetorizador
add $a2, $v0, $0

j fim


vetorizador:
	add $t0, $0, $0				# i = 0
	add $v0, $0, $0				# soma = 0
	while:					# while (i < tam){
		andi $t2, $t0, 1		# 	verifica se é ímpar
		beq $t2, $0, else		# 	if (ímpar){
			add $t3, $t0, 0		# 		t3 = i
			sw $t3, 0($a0)		# 		armazena (i) na posatual do vetor		
			j fimelse		# 	}
		else:				# 	else{
			sll $t3, $t0, 1		# 		t3 = 2i
			addi $t3, $t3, -1	# 		t3 = 2i-1
			sw $t3, 0($a0)		# 		armazena (2i-1) na posatual do vetor		
		fimelse:			# 	}
		add $v0, $v0, $t3		# 	soma = soma + t3 (2i-1 ou i)
		addi $a0, $a0, 4		# 	posatual = posatual + 4
		addi $t0, $t0, 1		# 	i++
		slt $t1,$t0,$a1			# 	t1 = i < tam
	bne $t1, $0, while			# }
	jr $ra

fim:



.data