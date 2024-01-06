data segment
    n db 10,13,"Helo Man $"
data ends

code segment
    assume cs:code, ds:data
    start:
        mov ax,data
        mov ds,ax
        
        
        lea dx, n
        call mydisp

        mov ah,4ch
        int 21h

    mydisp proc
    mov ah,09h
    int 21h
    ret
    mydisp endp
code ends
end start
