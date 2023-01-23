;jump.asm

extern printf

section .data
    number1 dq 42
    number2 dq 41
    fmt1    db "NUMBER1 >= NUMBER2",10,0
    fmt2    db "NUMBER1 < NUMBER2",10,0
section .bss
section .text
    global main
main:
    push rbp
    mov  rbp, rsp
    mov  rax, [number1] ; Move contents of number1 to rax
    mov  rbx, [number2] ; Move contents of number2 to rbx
    cmp  rax, rbx       ; Compare rax and rbx
    jge  greater        ; Jump to greater if rax >= rbx
    mov  rdi, fmt2      ; Move address of fmt2 to rdi (rax < rbx)
    xor  rax, rax       ; No xmm involved, so set rax to 0
    call printf         ; Call printf
    jmp  exit           ; Jump to label exit
greater:
    mov  rdi, fmt1      ; Move address of fmt1 to rdi (rax >= rbx)
    xor  rax, rax       ; No xmm involved, so set rax to 0
    call printf         ; Call printf
exit:
    mov  rsp, rbp
    pop  rbp
    ret