# x = $s0
# y = $s1
# x = -1;
# y = x / 32 ;
.text
.globl main
main:
addi $s0, $0, -1
sra $s1, $s0, 5
