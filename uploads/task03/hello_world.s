
section .data
    msg db 'Hello World!'

section .text
    global _start

_start:

    ; write(1, msg, 14)
    mov rax, 1                    ; syscall number 1 = sys_write
    mov rdi, 1                    ; file descriptor 1 = stdout
    mov rsi, msg                  ; pointer to message
    mov rdx, 12                   ; message length
    syscall                      ; make kernel call

    mov eax, 60       ; syscall number for exit
    mov edi, 4242       ; exit code
    syscall
