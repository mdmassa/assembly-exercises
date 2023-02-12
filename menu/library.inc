segment .data
        lenBuffer equ 0xA

segment .text

showOutput:
        call strLen
        mov eax, 0x4
        mov ebx, 0x1
        int 0x80

; Computar tamanho da string
strLen:
        mov edx, ecx

        nextChar:
          cmp byte[edx], 0xD   ; Verifica se o último valor da string é NULL
          jz finished
          inc edx
          jmp nextChar

        finished:
          sub edx, ecx
        ret


