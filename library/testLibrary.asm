%include 'library.inc'

section .text

    global _start

    _start:
        lea esi, [buffer]   ; Load Effective Address, vai espelhar o valor de buffer no registrador ESI
        add esi, 0x9        ; Vai adicionar o início de uma string a ESI
        mov byte[esi], 0xA  ; Adicionando uma quebra de linha ao registrador ESI

        dec esi
        mov dl, 0x41
        mov [esi], dl

        call outputRes

        mov eax, 0x1
        xor ebx, ebx
        int 0x80