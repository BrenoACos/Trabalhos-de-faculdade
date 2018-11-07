# int proximo=0,atual=0,anterior=1, a = 0;
# while(a < 100){
#    proximo=atual+anterior;
#	anterior=atual;
#	atual=proximo;
#	a = a+1;
# }

# ant = $s0
# atual = $s1
# prox = $s2
# a = $s3

.text
.globl main
main:
addi $s0, $0, 1			# ant = 1
addi $s1, $0, 0			# atual = 0
addi $s2, $0, 0			# prox = 0
addi $s3, $0, 0			# a = 0
addi $t0, $0, 0x1001		# t0 = 0x1001
sll $t0, $t0, 16		# t0 = 0x10010000
addi $t1, $0, 100		# t1 = 100

slt $t2, $s3, $t1		# t2 = a < 100
beq $t2, $0, fim		# while (a < 100){
while:
	add $s2, $s1, $s0 	# prox = atual + ant
	add $s0, $0, $s1	# ant = atual
	add $s1, $0, $s2	# atual = prox
	sw $s1, 0($t0)		# armazena o valor da variável atual primeira posição livre da memória
	addi $s3, $s3, 1	# a = a+1
	addi $t0, $t0, 4
	slt $t2, $s3, $t1	# t2 = a < 100 
	bne $t2, $0, while	# if (a<100) goto "while"
fim:
