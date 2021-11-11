.data
    mensagem: .asciiz "\n"
    mensagem_nao: .asciiz "Entrada invalida\n"
    num: .space4
.text
main:
    #lendo inteiro
    li $v0, 5
    syscall

    #salvando na variavel
    sw $v0, num($zero)

    add $s2, $zero, $zero

    lw $s0, num($zero)
    addi $t0, $zero, 1
    addi $t3, $zero, 2

for:    sle $t1, $t0, $s0
        beq $t1, $zero, fim_for

if:     rem $t2, $s0, $t0
        bne $t1, $zero, j_for
        addi $s2, $s2, 1

j_for: addi $t0, $t0, 1
        j for

fim_for:    bne $s2, $t3, mensagem_nao

finalProg: jr $ra