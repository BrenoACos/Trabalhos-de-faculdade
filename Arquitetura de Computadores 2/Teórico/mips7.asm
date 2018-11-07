# A [ 12 ] = h + A [ 8 ];

# $s0 = A[12]
# $s1 = h
# $s2 = A[8]

.text
.globl main
main:
addi $t0, $0, 0x1001 	# considerando que a primeira posição do arranjo esteja em 0x10010000
sll $t0, $t0, 16
lw $s2,  32($t0)	# s2 = A[8]
add $s0, $s1, $s2	# A[12] = h + A[8]
sw $s0, 48($t0)		# armazena o valor na posição 12 do arranjo.


.data
x0: .word 0x10010004
x1: .word 0
x2: .word 1
x3: .word 2
x4: .word 3
x5: .word 4
x6: .word 5
x7: .word 6
x8: .word 7
x9: .word 8
x10: .word 9
x11: .word 10
x12: .word 11
x13: .word 12
