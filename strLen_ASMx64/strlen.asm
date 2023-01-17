; strlen.asm

section .data
	msg1 db "Hello, world!",10,0      ; String with new line and null terminator chars
	msg1Len equ $-msg1-1              ; Length of msg1 excluding null terminator
	msg2 db "Alive and Kicking!",10,0 ; String with new line and null terminator chars
	msg2Len equ $-msg2-1              ; Length of msg1 excluding null terminator
	radius dq 357
	pi dq 3.14
section .bss
section .text
	global main
main:
	push rbp         ; Function prologue
	mov rbp, rsp     ; Function prologue
	mov rax, 1       ; System call number for write
	mov rdi, 1       ; File descriptor for stdout
	mov rsi, msg1    ; Address of string to write
	mov rdx, msg1Len ; Length of string to write
	syscall          ; Invoke operating system to write string
	mov rax, 1       ; System call number for write
	mov rdi, 1       ; File descriptor for stdout
	mov rsi, msg2    ; Address of string to write
	mov rdx, msg2Len ; Length of string to write
	syscall          ; Invoke operating system to write string
	mov rsp, rbp     ; Function epilogue
	pop rbp          ; Function epilogue
	mov rax, 60      ; System call number for exit
	mov rdi, 0	     ; Exit code
	syscall          ; Invoke operating system to exit