;hello.asm

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
    msg db "Hello, world", 0

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
; Moves a system call code (1) into the RAX register, meanning  it will be used for writing.
; Moves the file descriptor (1) into the RDI register, meaning it will be used for stdout (terrminal).
; Moves the address of the string into the RSI register, meaning it will be used for the string to display.
; Moves the length of the string into the RDX register, meaning it will be used for the length of the string.
; Executes the system call.
; Moves a system call code (60) into the RAX register, meanning  it will be used for exiting.
; Moves the exit code (0) into the RDI register, meaning it will be used for success exit code.
; Executes the system call.
main:            ; Label 'main' where the program starts.
    mov rax, 1   ; 1 = write
    mov rdi, 1   ; 1 = stdout
    mov rsi, msg ; string to display in rsi
    mov rdx, 12  ; length of string in rdx
    syscall      ; display the string
    mov rax, 60  ; 60 = exit
    mov rdi, 0   ; 0 = success exit code
    syscall      ; exit