.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    # prologue
    addi sp, sp, -8
    sw s0, 0(sp)
    sw s1, 4(sp)
    # prologue end
    ### recursive version begin
#     beq a0 x0 exit
#     addi sp sp -8
#     sw ra 0(sp)
#     sw a0 4(sp)
    
#     addi a0, a0, -1
#     jal ra, factorial
    
#     lw t0 4(sp)
#     lw ra 0(sp)
#     addi sp, sp, 8
#     mul a0, a0, t0
#     jalr x0, ra, 0
# exit:
#     addi a0, x0, 1
#     jalr x0, ra, 0
    ### recursive version end
    ### iterative version begin
    addi s0, x0, 1
    addi s1, x0, 1
loop:
    bgt s0, a0, exit
    mul s1, s1, s0
    addi s0, s0, 1
    jal x0, loop
exit:
    addi a0, s1, 0
    # episode
    lw s0, 0(sp)
    lw s1, 4(sp)
    addi sp, sp, 8
    # episode end
    jalr x0, ra, 0