.data
	N:.asciiz " "
	M:.asciiz " "
	diferenca: .asciiz " "
.text
main:
	li $v0,4
	la $a0,N
	syscall 
	
	li $v0, 5
	syscall 
	
	move $t0,$v0
	
	li $v0,4
	la $a0,M
	syscall 
	
	li $v0,5
	syscall 
	
	move $t1,$v0
	
	sub $t2,$t0,$t1 # soma o valor dos registradores $s0 e $s1 e insere no registrador $s2
	
	li $v0,4
	la $a0,diferenca
	syscall
	
	li $v0,1
	move $a0,$t2
	syscall
