; Linguagem Assembly
; Exercício 05

; Programa "Conversores de 'string para inteiro' e 'inteiro para string' "

%include 'library.inc'

section .data
        value dw '182', 0xA

section .text

    global _start:

    _start:
        call convert_value
        call show_value

    finish:
        mov eax, 0x1
        xor ebx, ebx
        int 0x80

    convert_value:
        lea esi, [value]
        mov ecx, 0x3
        call string_to_int
        add eax, 0x2
    ret

    show_value:
        call int_to_string
        call outputRes
    ret

    string_to_int:
        xor ebx, ebx

        .next_digit_SI:
            movzx eax, byte[esi]
            inc esi
            sub al, '0'
            imul ebx, 0xA
            add ebx, eax          ; Realizando a multiplicação de EBX por 10 e somando a EAX [ebx =* 10+ eax]
        loop .next_digit_SI       ; Corresponde ao while (--ecx) -> TAMANHO DA STRING

        mov eax, ebx
    ret

    int_to_string:
        lea esi, [buffer]
        add esi, 0x9
        mov byte[esi], 0xA
        mov ebx, 0xA

        .next_digit_IS:
            xor edx, edx
            div ebx
            add dl, '0'
            dec esi
            mov [esi], dl
            test eax, eax
        jnz .next_digit_IS
    ret