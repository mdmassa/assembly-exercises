; Linguagem Assembly
; Exercício 03

; Programa "Comparando números"

section .data
        msg db 'X é maior que Y', 0xA
        len equ $ - msg

        msg2 db 'Y é maior que X', 0xA
        len2 equ $ - msg2

        X dd 20             ; dd: define double [aloca 4 bytes]
        Y dd 86

section .text
    global _start

        ; JUMPERS
        ; jmp ->  jump to ..
        ; jge ->  jump to .. if greater or equal
        ; jg  ->  jump to .. if greater
        ; jle ->  jump to .. if lower or equal
        ; jl  ->  jump to .. if lower
        ; jne ->  jump to .. if not equal

    _start:
        mov eax, DWORD[X]   ; Movendo valor de X para o registrador EAX
        mov ebx, DWORD[Y]   ; Movendo valor de Y para o registrador EBX
        cmp eax, ebx        ; Comparando valores de EAX e EBX
        jge greater         ; Pular para label 'greater' caso o valor de EAX seja maior/igual que o de EBX

        mov ecx, msg2
        mov edx, len2

        jmp finish

    greater:
        mov ecx, msg
        mov edx, len

    finish:
        mov eax, 0x4
        mov ebx, 0x1
        int 0x80

        mov eax, 0x1
        xor ebx, ebx
        int 0x80

