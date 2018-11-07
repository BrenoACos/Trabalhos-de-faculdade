# x = $s0
# y = $s1
# x = 3;
# y = x * 1025 ;
.text
.globl main
main:

addi $s0, $0, 3		# x = 3
sll $t0, $s0, 10	# t0 = 3*1024
add $s1, $s0, $t0	# y = 3*1025
