; Linguagem Assembly
; Exercício 02

; Programa "Entrada de informações em Assembly"

section .data
        msg db 'Digite seu nome: '
        len equ $ - msg

        msg2 db 'Digite seu curso: '
        len2 equ $ - msg2

        QL db 0xA                           ; Definindo quebra de linha

section .bss
        name resb 1                         ; Declarando "variáveis" que irão receber as respostas do usuário
        course resb 1                       ; resb -> reserva 1 byte

section .text
    global _start
    _start:
        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, msg
        mov edx, len
        int 0x80

        mov eax, 0x3                        ; Definindo que o programa requer uma entrada
        mov ebx, 0x0                        ; Definindo a escrita será feita na entrada padrão (teclado)
        mov ecx, name                       ; Chamando quem irá receber os valores de entrada
        mov edx, 0xC                        ; Definindo o tamanho da entrada
        int 0x80

        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, name
        mov edx, 0xC
        int 0x80

        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, msg2
        mov edx, len2
        int 0x80

        mov eax, 0x3
        mov ebx, 0x0
        mov ecx, course
        mov edx, 0xA
        int 0x80

        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, course
        mov edx, 0xA
        int 0x80

        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, QL
        mov edx, 0x1
        int 0x80

    finish:
        mov eax, 0x1
        mov ebx, 0x0
        int 0x80