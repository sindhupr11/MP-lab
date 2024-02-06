;enter a string and a substring and a number. replace the substring in the string from the nth position

data segment
    msg1 db 10,13,"Enter String: $"
    msg2 db 10,13,"Enter substring: $"
    num db 10,13,"Enter number: $"
    resm db 10,13,"Result: $", 0Dh
    n db ?
    str1 db 16 dup(?)
    str2 db 16 dup(?)
data ends

code segment
    assume cs:code,ds:data

start:
    mov ax, data
    mov ds, ax

    mov si, offset str1
    lea dx, msg1
    call display1    

loop1:;str1
    call input
    cmp al, 0dh
    je skip1
    mov [si], al
    inc si
    jmp loop1
    skip1:
    mov [si],'$'

    lea si, str2
    lea dx, msg2
    call display1

loop2:;str2
    call input
    cmp al, 13
    je skip2
    mov [si], al
    inc si
    jmp loop2
    skip2:
    mov [si],'$'

    lea dx, num
    call display1

    call input
    sub al, 30h
    mov n, al

    lea dx, resm
    mov ah, 09h
    int 21h
    
    mov al, offset str1
    add al, n 
    mov ah, 00h
    mov si, ax

    mov di, offset str2

    mov al,'$'
loop3:
    cmp [di],al
    je exit
    mov bl,[di]
    mov [si],bl
    inc si
    inc di
    jmp loop3

exit:

    

    lea dx, str1
    call display1

    mov ah, 4ch
    int 21H

display1 proc
    mov ah, 09h
    int 21h
    ret
display1 endp

input proc
   mov ah, 01h
    int 21h
    ret
input endp

    mov ah, 4ch
    int 21H

code ends
end start
