	.data
	
invalido:	.asciiz "Entrada invalida.\n"  	#Resposta para entrada invalida
sim:		.asciiz "sim\n"		#Resposta para numero primo
nao:		.asciiz "nao\n"		#Resposta para numero composto

	.text
main:
	li $v0, 5  #Comando para ler um inteiro
	syscall  #Executa a leitura do primeiro inteiro
	 
	add $s0 $v0, $zero  #Equivale a s0 = v0 + 0
	add $t2 $v0, $zero  #Equivale a t2 = v0 + 0
	
	ble $s0, $zero, fim_inv  #Se $s0 for menor ou igual a 0 pula para fim_inv
	beq $s0, 1, fim_nao  #Se $s0 for igual a 1 pula para fim_nao
	beq $s0, 2, fim_sim  #Se $s0 for igual a 2 pula para fim_sim
	beq $s0, 3, fim_sim  #Se $s0 for igual a 3 pula para fim_sim
	addi $t0, $zero, 2  #Equivale a t0 = 0 + 2
	divu $s0, $t0  #Divide o $s0 pelo $t0 e armazena o resto em HI
	mfhi $t1  #Copia o valor de HI para o registrador $t1
	beq $t1, $zero, fim_nao  #Se $t1 for igual a 0 pula para fim_nao
	add $s1, $zero, $zero  #Equivale a s1 = 0 + 0
	jal sqrt  #pula para sqrt (encontra a raiz do número salvo em $t2 e armazena em $s1)
	add $t0, $zero, 3  #Equivale a t0 = 0 + 3
	
primo:
	divu $s0, $t0  #Divide o $s0 pelo $t0 e armazena o resto em HI
	mfhi $t1  #Copia o valor de HI para o registrador $t1
	beq $t1, $zero, fim_nao  #Se $t1 for igual a 0 pula para fim_nao
	addi $t0, $t0, 2  #Equivale a t0 = t0 + 2
	ble $t0, $s1, primo  #Se $t0 for menor ou igual a $s1 (raiz de $s0) pula para primo
	j fim_sim  #pula para fim_sim
	
	
sqrt:
	mul $t0, $s1, 2  #Equivale a t0 = s1 * 2
	add $t0, $t0, 1  #Equivale a t0 = t0 + 1
	sub $t2, $t2, $t0  #Equivale a t2 = t2 - t0
	add $s1, $s1, 1  #Incrementa o contador, que sera o resultado da raiz
	beq $t2, $zero, succes  #Se $t2 for igual a zero a raiz é exata
	slt $t0, $t2, $zero  #Se $t2 for menor que 0, $t0 passa a valer 1
	beq $t0, 1, error  #Se $t0 for igual a 1 pula para error (Significa que a raiz não é exata)
	j sqrt  #Pula para sqrt
	
error:
	sub $s1, $s1, 1  #Equivale a s1 = s1 - 1
	
succes:
	jr $ra  #Retorna para a próxima linha da primeira chamada de sqrt


fim_sim:
	li $v0, 4  #Comando para imprimir uma string
	la $a0, sim  #Indicando o endereço da mensagem
	syscall  #Executar
	
	j exit  #Pula para exit
	
fim_nao:
	li $v0, 4  #Comando para imprimir uma string
	la $a0, nao  #Indicando o endereço da mensagem
	syscall  #Executar
	
	j exit  #Pula para exit
	
fim_inv:
	li $v0, 4  #Comando para imprimir uma string
	la $a0, invalido  #Indicando o endereço da mensagem
	syscall  #Executar
	
exit:
	li $v0, 10  #Comando para finalizar programa
	syscall  #Executar
	
