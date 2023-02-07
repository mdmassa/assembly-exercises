segment .data
        lenBuffer equ 0xA

segment .bss
        buffer resb 0x1

segment .text

    outputRes:
        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, buffer
        mov edx, lenBuffer
        int 0x80
        ret
