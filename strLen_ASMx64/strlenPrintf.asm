; strlen.asm

extern printf ; Declare printf as an external function

section .data
	msg1   db "Hello, world!",0      ; String with new line and null terminator chars
	msg2   db "Alive and Kicking!",0 ; String with new line and null terminator chars
	radius dq 357                    ; Integer value
	pi     dq 3.14 					 ; Floating point value
	fmtstr db "%s",10,0              ; Format string for printf
	fmtflt db "%lf",10,0             ; Format long float for printf
	fmtint db "%d",10,0              ; Format integer for printf
section .bss
section .text
	global main
main:
	push rbp
	mov  rbp, rsp
	; print msg1
	mov  rax, 0 ; No floating point
	mov  rdi, fmtstr
	mov  rsi, msg1
	call printf
	; print msg2
	mov  rax, 0 ; No floating point
	mov  rdi, fmtstr
	mov  rsi, msg2
	call printf
	; print radius
	mov  rax, 0 ; No floating point
	mov  rdi, fmtint
	mov  rsi, [radius] ; Why the square brackets?
	call printf
	; print pi
	mov  rax, 1 ; 1 xmm register used
	movq xmm0, [pi] ; Why the square brackets?
	mov  rdi, fmtflt
	call printf
	mov  rsp, rbp
	pop  rbp
	ret
