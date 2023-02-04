section .data
        msg db 'Digite seu nome: '
        len equ $ - msg

section .bss
        name resb 1

section .text
    global _start
    _start:
        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, msg
        mov edx, len
        int 0x80

        mov eax, 0x3
        mov ebx, 0x0
        mov ecx, name
        mov edx, 0xC
        int 0x80

        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, name
        mov edx, 0xC
        int 0x80

    finish:
        mov eax, 0x1
        mov ebx, 0x0
        int 0x80