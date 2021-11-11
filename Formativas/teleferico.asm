.data
	C:.asciiz " "
	A:.asciiz " "
	resu:.asciiz " "
.text
main:
	li $v0,4
	la $a0,C
	syscall
	
	li $v0, 5
	syscall 
	
	move $t0,$v0 # $t0 e C
		
	li $v0,4
	la $a0,A
	syscall 
	
	li $v0,5
	syscall 
	
	move $t1,$v0 # $t1 e A
	
	addiu $t2,$t0,-1
	
	rem $t3,$t1,$t0
	
	beq $t3,$zero,L1
	
	l1:div $t4,$t1,$t2
	jr $ra
	
	div $t4,$t1,$t2
	addi $t5,$t4,1
	
	li $v0,4
	la $a0,diferenca
	syscall
	
	li $v0,1
	move $a0,$t2
	syscall
	
	#sub $t2,$t0,1
	#rem $t4,$t1,$t2
	
	##move $k1,$t3
	
	
	#sub $t2,$t0,1
	