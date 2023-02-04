; Linguagem Assembly
; Exercício 01

; Programa "Hello World!"

section .data
    msg db 'Hello World!', 0xA  ; Mensagem que será enviada na saída
    len equ $ - msg             ; Definindo o tamanho da mensagem

section .text
    global _start
    _start:
        mov eax, 0x4            ; Definindo que o programa requer uma saída
        mov ebx, 0x1            ; Definindo que a mensagem será enviada na saída padrão (Ou seja, o terminal)
        mov ecx, msg            ; Conteúdo da saída
        mov edx, len            ; Quantidade de caracteres da saída
        int 0x80                ; Comunicação com o SO para a execução dos comandos

    finish:
        mov eax, 0x1            ; Informa a finalização do programa
        mov ebx, 0x0            ; Retorna o valor 0 para indicar que tudo ocorreu corretamente
        int 0x80                ; Comunicação com o SO para a execução dos comandos