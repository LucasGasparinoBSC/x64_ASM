; memory1.asm

section .data                     ; Constant data seection
    bNum           db 123         ; 8-bit integer
    wNum           dw 12345       ; 16-bit integer
    dNum           dd 12345       ; 32-bit integer
    qNum1          dq 12345       ; 64-bit integer
    qNum2          dq 3.141592654 ; 64-bit floating point
    text1          db "abc", 0    ; Pointer to 1st character in string
    text2          db "cde", 0    ; Pointer to 1st character in string
    wArray times 5 dw 0           ; Array of 5 words (all entries are 0)
section .bss                      ; Uninitialized data section
    bVar           resb 1         ;
    wVar           resw 10        ;
    dVar           resd 1         ;
    qVar           resq 3         ;
section .text
    global main
main:
    push rbp
    mov  rbp, rsp
    lea  rax, [bNum]    ; Load addr. of bNum in rax
    mov  rax, bNum      ; Load addr. of bNum in rax
    xor  rax, rax       ; Clear rax
    mov  al , [bNum]    ; Load value at bNum in rax
    mov  [bVar], al     ; Load fromm rax at addr. of bVar
    lea  rax, [bVar]    ; Load addr. of bVar in rax
    lea  rax, [wNum]    ; Load addr. of wNum in rax
    mov  rax, [wNum]    ; Load value at wNum in rax
    lea  rax, [text1]   ; Load addr. of text1 in rax
    mov  rax, text1     ; Load addr. of text1 in rax
    mov  rax, text1+1   ; Load addr. of 2nd char of text1 in rax
    lea  rax, [text1+1] ; Load addr. of 2nd char of text1 in rax
    mov  rax, [text1]   ; Load 1st character of text1 in rax
    mov  rax, [text1+1] ; Load 2nd character of text1 in rax
    mov  rsp, rbp
    pop  rbp
    ret