;hello.asm

extern printf ; declare the function printf as external, meaning it is not defined in this file

; Data section: section for declaring initialized data in the format:
; 		<var name> <type> <value>
; Possible data types are:
; 		db - byte - 8 bits
; 		dw - word - 16 bits
; 		dd - double word - 32 bits
; 		dq - quad word - 64 bits
; this section can also contain constants that cannot be changed by the program, declared as:
; 		<var name> equ <value>
section .data
	; Here, 'msg' points to the memory address of the 1st byte (db) of the string, character "H"
	; The 0 after the string indicates the end of a human-readable string (NULL terminator)
    ; The variable "fmtstr" is a string with a format specifier (%s) for a string, and a newline character (10)
    msg    db "Hello, world!", 0
    fmtstr db "This is our string: %s",10,0

; BSS section: section for declaring uninitialized data in the format:
; 		<var name> <type> <number>
; Possible data types are:
; 		resb - byte - 8 bits
; 		resw - word - 16 bits
; 		resd - double word - 32 bits
; 		resq - quad word - 64 bits
; For example, an array with 20 64-bit entries can be declared as:
; 		arr resq 20
; Variables declared here do not have values: at execution time, the program
; will allocate memory for them, and initialize them to zero. Thet can later be
; changed by the program.
section .bss

; Text section: section for declaring the source code itself. It starts with the
; entry point of the program, which is the function 'main' in this case, declared
; as a global function.
section .text
    global main ; declare label main as a global function, and start point of the program

; Label main: description
; 		<function name>:
;       Function prologue
;       Set the 1st argument of printf in RDI (format string)
;       Set the 2nd argument of printf in RSI (string)
;       Set the system call code in RAX (0)
;       Call the function printf
;       Functionn epilogue
;       Set the system call code in RAX (60)
;       Set the exit code in RDI (0)
;       Execute the system call

main:                ; Label 'main' where the program starts.
    push rbp         ; save the base pointer
    mov  rbp, rsp    ; set the base pointer to the stack pointer
    mov  rdi, fmtstr ; move the address of the format string into the RDI register (1st arg of printf)
    mov  rsi, msg    ; move the address of the string into the RSI register (2nd arg of printf)
    mov  rax, 0      ; move the system call code (0) into the RAX register (no xmm involved (?))
    call printf      ; call the function printf
    mov  rsp, rbp    ; restore the stack pointer
    pop  rbp         ; restore the base pointer
    mov  rax, 60     ; move the system call code (60) into the RAX register (exit)
    mov  rdi, 0      ; move the exit code (0) into the RDI register (success)
    syscall          ; execute the system call