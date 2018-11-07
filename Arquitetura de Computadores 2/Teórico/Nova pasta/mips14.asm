#      if (x <= y){             
#         if (y <= z)
#            meio = y;
#         else if (x <= z)
#            meio = z;
#         else
#            meio = x;
#      }else{
#         if (x <= z)
#            meio = x;
#         else if(z <= y)
#            meio = y;
#         else
#            meio = z;
#      }

# $s0 = x
# $s1 = y
# $s2 = z
# $s3 = meio

.text
.globl main
main:

addi $t0, $0, 0x1001
sll $t0, $t0, 16
lw $s0,	0($t0)
lw $s1, 4($t0)
lw $s2, 8($t0)
slt $t1, $s1, $s0
bne $t1, $0, xGTy			# if (x <= y)
	slt $t1, $s2, $s1
	bne $t1, $0, yGTz		# if (y <= z)
		add $s3, $0, $s1	# meio = y;
		beq $0, $0, FIM
	yGTz:				# y Greater Than z
	slt $t1, $s2, $s0
	bne $t1, $0, Mx			# else if (x <= z)
		add $s3, $0, $s2	# meio = z;
		beq $0, $0, FIM
	Mx:				# Middle x
		add $s3, $0, $s0	# meio = x;
		beq $0, $0, FIM
xGTy:					# x Greater Than y
	slt $t1, $s2, $s0
	bne $t1, $0, xGTz
		add $s3, $0, $s0	# meio = x;
		beq $0, $0, FIM
	xGTz:				# x Greater Than z
	slt $t1, $s1, $s2
	bne $t1, $0, Mz			# else if (z <= y)
		add $s3, $0, $s1	# meio = y
		beq $0, $0, FIM
	Mz:
		add $s3, $0, $s2	# meio = z
FIM:

.data

x: .word 1
y: .word 1
z: .word 1