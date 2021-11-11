.data
        numero_primo:   .asciiz "sim\n"
        numero_n_primo: .asciiz "nao\n"
        numero_n_inteiro: .asciiz "Entrada invalida.\n"
.text

main:
    li $v0, 5
	syscall

    move $s0, $v0 #atribuindo entrada do usuario ao registrador ao s0
    move $t1, $zero #t1 = 0
    addi $s2, $zero, 2 #s2 = 2
    
    beq $s0, 2, s_primo#se s0 for igual a 2 ele e primo
    
    beq $s0, 1, n_primo #se s0 for igual a 1 ele n e primo
    
    blt $s0, 1, entrada_invalida # se ele for menor que 1 ele e invalido

    li $t3, 2
    div $t2, $s0, $t3
    mfhi $t4

    beq $t4, 0 ,n_primo# caso ele for par ele retorna n primo
	
    addi $s2, $s2, 1 #s2 = 3
    
    
    
    for:
    div $s0, $s2       		
    mfhi $t3 #resto da div de s0 e s2
    
    mul $t5,$s2,$s2 #multiplicando duas vezes o s2 e guardando em t5
    
    bgt $t5,$s0,s_primo #se t5 for maior que s0 e pq ele e primo
    
    beq $t3,0,n_primo #se o resto da divisao for = a 0 ele n e primo
    
    addi $s2,$s2,2 #somando 2 ao s2
    
    j for

    n_primo:
    li $v0, 4
	la $a0, numero_n_primo
	syscall
    j exit

    s_primo:
    li $v0, 4
	la $a0, numero_primo
	syscall
    j exit

    entrada_invalida:
    li $v0, 4
	la $a0, numero_n_inteiro
	syscall
    j exit

    exit:
    li $v0, 10
    syscall
