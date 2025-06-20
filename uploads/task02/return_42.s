section .text
    global _start

_start:
    mov eax, 60       ; syscall number for exit
    mov edi, 42       ; exit code
    syscall
