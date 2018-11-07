#a = $s0
#b = $s1
#c = $s2
#a = 10;
#b = -1;
#a = a + 1;
#c = a + b;

.text
.globl main
main:

addi $s0,$0,10	# a = 10
addi $s1,$0,-1	# b = -1
addi $s0,$s0,1	# a = a + 1
add $s2,$s0,$s1	# c = a + b