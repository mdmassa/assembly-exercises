; Linguagem Assembly
; Exercício 04

; Programa "Criando uma biblioteca e trabalhando com Buffers"

%include 'library.inc'

section .text

    global _start

    _start:
        lea esi, [buffer]   ; Load Effective Address, vai espelhar o valor de buffer no registrador ESI
        add esi, 0x9        ; Vai adicionar o início de uma string a ESI
        mov byte[esi], 0xA  ; Adicionando uma quebra de linha ao registrador ESI

        dec esi             ; Decrementar 1 de ESI
        mov dl, 0x41        ; Movendo o caractere A para o registrador DL
        mov [esi], dl       ; Movendo valor no DL para o registrador ESI

        call outputRes      ; Chamando outputRes da biblioteca library.inc

        mov eax, 0x1
        xor ebx, ebx
        int 0x80