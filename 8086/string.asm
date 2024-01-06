data segment
    msg db 10,13,"Enter string: $"
    n db 50 dup (?)," $"
data ends

code segment
    assume cs:code, ds:data
    start:
        mov ax,data
        mov ds,ax

        mov cl, 00H
        mov si, offset n

        lea dx,msg
        call mydisp

    loop3:
        call input
        cmp al, 13
        jz exit3
        mov [si],al
        inc si
        inc cl
        jmp loop3
    exit3:

        lea dx, msg
        call mydisp
    loop1:
        call input
        cmp al, 13
        jz exit1
        mov [si],al
        inc si
        inc cl
        jmp loop1
    exit1:

        lea dx,msg
        call mydisp

        mov si, offset n

    loop2:
        mov dl, [si]
        call dispchar
        inc si
        dec cl
        jnz loop2

        mov ah,4ch
        int 21h
    ; Procedure declarations
        mydisp proc
            mov ah,09h
            int 21h
            ret
        mydisp endp

        input proc  
            mov ah,01h
            int 21h
            ret
        input endp

        dispchar proc
            mov ah,02h
            int 21h
            ret
        dispchar endp

code ends
end start