; loop2.asm

extern printf

section .data
    number dq 1000000000
    fmt    db "The sum from 0 to %ld is %ld", 10, 0
section .bss
section .text
    global main
main:
    push rbp
    mov  rbp, rsp
    mov  rcx, [number] ; Initialize rcx to the contents of number (decremental counter).
    xor  rax, rax      ; Initialize rax to 0 (sum).
bloop:                 ; Loop label
    add  rax, rcx      ; Add the current value of rcx to rax.
    loop bloop         ; Decrement rcx by 1 and jump back to bloop if rcx is not 0.
    mov  rdi, fmt      ; Initialize rdi to the address of fmt.
    mov  rsi, [number] ; Initialize rsi to the contents of number.
    mov  rdx, rax      ; Initialize rdx to the contents of rax.
    xor  rax, rax      ; No xmm involved
    call printf        ; Call printf.
    mov  rsp, rbp
    pop  rbp
    ret