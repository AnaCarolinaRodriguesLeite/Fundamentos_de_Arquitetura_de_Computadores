.data
	numero1:.asciiz "num1:"
	numero2:.asciiz "num2:"
	resultado: .float  "resultado:"
.text
main:
	li $v0,4
	la $a0,numero1
	syscall 
	
	li $v0, 5
	syscall 
	
	move $t0,$v0
	
	li $v0,4
	la $a0,numero2
	syscall 
	
	li $v0,5
	syscall 
	
	move $t1,$v0
	
	add $t2,$t1,$t0 # soma o valor dos registradores $s0 e $s1 e insere no registrador $s2
	
	li $v0,4
	la $a0,resultado
	syscall
	
	li $v0,1
	move $a0,$t2
	syscall