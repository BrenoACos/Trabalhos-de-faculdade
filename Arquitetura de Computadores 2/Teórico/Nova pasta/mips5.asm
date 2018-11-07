# x = $s0;
# x = 305419896;
.text
.globl main
main:
addi $s0, $0, 0x1234
sll $s0, $s0, 16
addi $s0, $s0, 0x5678