.data
        numero_n_fatorado: .asciiz "Entrada invalida.\n"
        num_fatorado: .asciiz " \n"
.text
main:
    li $v0, 5
    syscall

    move $s0, $v0 #atribuindo entrada do usuario ao registrador ao s0
    
    beq $s0, 2, fatorado#se s0 for igual a 2 ele e primo e pode ser fatorado
    
    bne $s0, 1, invalido   #se o num inserido for menor que 1
    
    bgt $s0, 32767, invalido #se o num inserido for maior que 32768
    
    divisao_primo:
    li $t1, 3 #inserindo o valor 2 ao reg t3
    div $s0, $t1 #dividindo t1 com s0 e guardando em t2
    mfhi $t2 #resto da div entre t3 e s0
    mul $t3, $s2, $s2 #multiplicando duas vezes o s2 e guardando em t5
    bgt $t3, $s0, divisao_fatorado #se t5 for maior que s0 e pq ele e primo
    beq $t3, 0, invalido #se o resto da divisao for igual a 0 ele n e primo
    j divisao_fatorado
    
    divisao_fatorado:
    div $s0, $t1 #divisao de t1 e s0
    mfhi $t4 #resto da divisao
    beq $t4, 0, fatorado #se o resto for igual a zero ele printa os numeros
    bne $t4, 0, pula_prox #se for diferente de zero pula pro pula_prox
    j divisao_primo
       
    fatorado:
    li $v0, 4
    la $a0, num_fatorado
    syscall
    j exit
    
    pula_prox:
    addi $s2, $zero, 2 #s2 = 5
    j divisao_primo
    
    invalido:
    li $v0, 4
    la $a0, numero_n_fatorado
    syscall
    j exit
    
    exit:
    li $v0, 10
    syscall
