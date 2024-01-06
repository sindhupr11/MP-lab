data segment
    msg db 10,13,"Enter Number: $"
    res db ?
    n1 db ?
    n2 db ?

data ends

code segment
    assume cs:code, ds:data
    start:
        mov ax,data
        mov ds,ax

        mov cl,4H
    
        lea dx, msg
        call mydisp
        call input
        call tohex
        rol al,cl
        mov n1,al
        call input
        call tohex
        add n1,al

        lea dx, msg
        call mydisp
        call input
        call tohex
        rol al,cl
        mov n2,al
        call input
        call tohex
        add n2,al
        
        mov al,n1
        adc al,n2
        mov res,al

        lea dx, msg
        call mydisp
        mov al,res
        and al,00F0H
        rol al, cl
        call toascii
        mov dl,al
        call dispchar

        lea dx, msg
        mov al,res
        and al,000FH
        call toascii
        mov dl,al
        call dispchar


        mov ah,4ch
        int 21h

;prodedures
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
    tohex proc
        sub al,30H
        cmp al,9h
        jbe skip
        sub al,7H
        skip:
        ret
    tohex endp
    toascii proc
        add al,30H
        cmp al,'9'
        jbe skip2
        add al,7H
        skip2:
        ret
    toascii endp

code ends
end start
