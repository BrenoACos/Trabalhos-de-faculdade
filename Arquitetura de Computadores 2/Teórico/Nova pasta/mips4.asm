# x = $s0
# y = $s1
# x = 3;
# y = x / 4 ;
.text
.globl main
main:

addi $s0, $0, 3		# x = 3
sra $s1, $s0, 2		# y = x/4