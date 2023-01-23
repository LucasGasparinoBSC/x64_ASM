section .data
    bNum  db 123
    wNum  dw 12345
    dNum  dd 1234567890
    qNum1 dq 1234567890123456789
    qNum2 dq 123456
    qNum3 dq 3.14

section .bss
section .text
    global main
main:
    push rbp
    mov  rbp, rsp
    mov  rax, -1          ; Fill rax with 1s
    mov  al , byte [bNum]  ; Upper bits of rax are not not correct
    xor  rax, rax
    mov  al , byte [bNum]
    mov  rax, -1
    mov  ax , word [wNum]
    xor  rax, rax
    mov  ax , word [wNum]
    mov  rax, -1
    mov  eax, dword [dNum]  ; Upper bits of rax are cleared here
    mov  rax, -1 
    mov  rax, qword [qNum1] 
    mov qword [qNum2], rax  ; changes the value of qNum2 to what's inside rax
    mov  rax, 123456        ; source operand an immediate value (?)
    movq xmm0, [qNum3]      ; floating point instruction
    mov  rsp, rbp
    pop  rbp
    ret