# j = 0;
# i = 10;
# do
#  {
#  j = j + 1;
#  }
# while ( j != i );

# i = $s0
# j = $s1

.text
.globl main
main:

addi $s0, $0, 10
addi $s1, $0, 0

dowhile:			# do{
addi $s1, $s1, 1		# j = j+1
bne $s1, $s0, dowhile		# }while(j<i)


