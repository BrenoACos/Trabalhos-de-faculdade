
#  long x = 5, y = 3, resp = x, i = 0;
#  if (y <0)
#     resp = 0;
#  else if (y == 0)
#     resp = 1;
#  else{
#     while (i <y-1){
#        resp *= x ;
#    	 i++;
#     }
#  }  

# x = $s0
# y = $s1
# resp = $s2
# i = $t3

.text
.globl main

main:
addi $t0, $0, 0x1001
sll $t0, $t0, 16	
addi $t1, $0, 1				# t1 = 1
addi $t3, $0, 0				# i = 0
lw $s0, 0($t0)				# x = valor inserido na memória
lw $s1, 4($t0)				# y = valor inserido na memória
addi $t2, $s1, -1			# t2 = y-1
addi $s2, $s0, 0			# resp = x
slt $t4, $s1, $0			# t4 = (y<0)
bne $s1, $0, elseif			# if (y < 0)
	sw $0, 8($t0)			# resp = 0
	j fim
elseif:
bne $s1, $0, else			# if (y == 0)
	sw $t1, 8($t0)			# resp = 1
	j fim
else:
	slt $t4, $t3, $t2		# t4 = (i<y-1)
	beq $t4, $0, fimwhile		# while(i<y-1)
	while:
		mult $s2, $s0		# resp * x
		mflo $s2		# resp = resp *x
		addi $t3, $t3, 1	# i++
		slt $t4, $t3, $t2	# t4 = (x<y-1)
		beq $t4, $t1, while
	fimwhile:
	sw $s2, 8($t0)
fim:


.data
x: .word 5
y: .word 3