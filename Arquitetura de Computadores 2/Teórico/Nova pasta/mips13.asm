# leia n�mero;
# se ( 50 <= n�mero <=100 ou 150 <= n�mero <= 200)
#  registrador flag = 1;
# caso contr�rio
#  registrador flag = 0;

#flag = $s1
.text
.globl main
main:

addi $t0, $0, 0x1001
sll $t0, $t0, 16
lw $s0, 0($t0)
addi $t1, $0, 50
addi $t2, $0, 100
addi $t3, $0, 150
addi $t4, $0, 200
slt $t5, $s0, $t1	# t5 = (50 <= n�mero)
bne $t5, $0, FIM	# if (n�mero <= 50)
slt $t5, $t2, $s0	# t5 = (n�mero <= 100)
bne $t5, $0, OU
addi $s1, $0, 1		# flag = 1
beq $0, $0, FIM
OU:
slt $t5, $s0, $t3	# t5 = (150 <= n�mero)
bne $t5, $0, FIM
slt $t5, $t4, $s0
bne $t5, $0, FIM
addi $s1, $0, 1
beq $0, $0, FIM
addi $s1, $0, 0
FIM:
