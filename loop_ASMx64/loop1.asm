; loop1.asm

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
    mov  rbx, 0        ; Counter for the loop
    xor  rax, rax      ; Sum stored in rax, initialized to 0
jloop:                 ; Loop label
    add  rax, rbx      ; Add current rbx value to the sum in rax
    inc  rbx           ; Increment rbx
    cmp  rbx, [number] ; Compare rbx to the content of number
    jle  jloop         ; If rbx <= number, repeat the loop
    mov  rdi, fmt      ; First argument for printf
    mov  rsi, [number] ; Second argument for printf
    mov  rdx, rax      ; Third argument for printf
    xor  rax, rax      ; No xmm involved
    call printf        ; Call printf
    mov  rsp, rbp
    pop  rbp
    ret