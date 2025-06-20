
section .data
    msg db '/bin/sh'

section .text
    global _start

_start:

    mov rax, 59                    ; syscall number 1 = sys_write, 59 execve
    ;; mov rdi, msg                    ; pointer to filename
	lea rdi, [rel msg]
    mov rsi, 0                  ; pointer to argv
    mov rdx, 0                   ; pointer to envp
    syscall                      ; make kernel call

    mov eax, 60       ; syscall number for exit
    mov edi, 4242       ; exit code
    syscall
