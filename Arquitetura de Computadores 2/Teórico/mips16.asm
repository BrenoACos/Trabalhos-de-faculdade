# s4 = d
# s3 = c
# s2 = b
# s1 = a							 Total = 595
addi $S3, $S2, 396	# c = 396+b				   ALU = 298	CPIm = 4,83
LOOP:			#					Desvio = 99	CPUt = 22,8 us
lw $S1, 0($S2)		# a = pos b mem				   Mem = 198	
addi $S1, $S1, 1	# a= a+1
sw $S1, 0 ($S2)		# pos b mem = a+1
addi $s2, $s2, 4	# b = b + 4
sub $S4, $S3, $S2	# d = c - b		
bne $S4, $zero, LOOP	# do{ }while (d != 0)