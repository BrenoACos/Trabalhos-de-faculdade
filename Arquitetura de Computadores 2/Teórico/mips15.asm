# n = $s0
# soma = $s2

.text
.globl main
main:
			#  Total = 896			CPIm = 3,34
			#    ALU = 696 * 3 = 2088	CPUt = 29,89 us
			# Desvio = 99 * 4 = 396		Spup
			#    Mem = 101 * 5 = 505


lui $s1, 0x1001
addi $s0, $0, 0				# n = 0;
addi $t0, $0, 99			# t = 99;
#add $t2, $0, $s1			# t2 = posição da memória do valor atual
lw $s2, 0($s1)				# soma = A[0]
dowhile:
	lw $t3, 4($s1)			# t3 = a[n+1]
	nop
	nop
	add $s2, $s2, $t3		# soma = soma + A[n+1]
	addi $s0, $s0, 1		# n = n+1
#	sll $t2, $s0, 2			# t2 = 4n
#	add $t2, $t2, $s1		# t2 = posição na memória do valor atual
	addi $s1, $s1, 4
	slt $t1, $s0, $t0		# (n < 99)
	bne $t1, $0, dowhile	
sw $s2, 4($s1)				# armazena soma na primeira posição após o vetor

.data

x0: .word 1
x1: .word 1
x2: .word 1
x3: .word 1
x4: .word 1
x5: .word 1
x6: .word 1
x7: .word 1
x8: .word 1
x9: .word 1
x10: .word 1
x11: .word 1
x12: .word 1
x13: .word 1
x14: .word 1
x15: .word 1
x16: .word 1
x17: .word 1
x18: .word 1
x19: .word 1
x20: .word 1
x21: .word 1
x22: .word 1
x23: .word 1
x24: .word 1
x25: .word 1
x26: .word 1
x27: .word 1
x28: .word 1
x29: .word 1
x30: .word 1
x31: .word 1
x32: .word 1
x33: .word 1
x34: .word 1
x35: .word 1
x36: .word 1
x37: .word 1
x38: .word 1
x39: .word 1
x40: .word 1
x41: .word 1
x42: .word 1
x43: .word 1
x44: .word 1
x45: .word 1
x46: .word 1
x47: .word 1
x48: .word 1
x49: .word 1
x50: .word 1
x51: .word 1
x52: .word 1
x53: .word 1
x54: .word 1
x55: .word 1
x56: .word 1
x57: .word 1
x58: .word 1
x59: .word 1
x60: .word 1
x61: .word 1
x62: .word 1
x63: .word 1
x64: .word 1
x65: .word 1
x66: .word 1
x67: .word 1
x68: .word 1
x69: .word 1
x70: .word 1
x71: .word 1
x72: .word 1
x73: .word 1
x74: .word 1
x75: .word 1
x76: .word 1
x77: .word 1
x78: .word 1
x79: .word 1
x80: .word 1
x81: .word 1
x82: .word 1
x83: .word 1
x84: .word 1
x85: .word 1
x86: .word 1
x87: .word 1
x88: .word 1
x89: .word 1
x90: .word 1
x91: .word 1
x92: .word 1
x93: .word 1
x94: .word 1
x95: .word 1
x96: .word 1
x97: .word 1
x98: .word 1
x99: .word 1
