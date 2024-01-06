data segment
    sourceString db "Hello World, World!", '$'
    targetString db "World", '$'
    replacementString db "Universe", '$'
    resultString db 255 dup (?)
data ends

code segment
    assume cs:code, ds:data

start:
    mov ax, data
    mov ds, ax

    lea si, sourceString
    lea di, resultString

find_replace_loop:
    mov bx, si  ; bx = current position in sourceString
    mov cx, 0   ; Counter for targetString length

compare_loop:
    lea si, targetString
    mov cx, 0   ; Counter for targetString length

target_compare_loop:
    mov al, [si]
    cmp al, '$'
    je  target_matched  ; End of targetString? -> target matched
    cmp [bx + cx], al
    jne mismatched     ; Mismatch? -> Go to mismatched

    inc cx
    inc si
    jmp target_compare_loop

target_matched:
    lea si, replacementString

copy_replacement_loop:
    mov al, [si]
    cmp al, '$'
    je  update_source_index  ; End of replacementString? -> update source index
    mov [di], al
    inc di
    inc si
    jmp copy_replacement_loop

mismatched:
    mov al, [bx]
    cmp al, '$'
    je  end_program  ; End of sourceString? -> end program
    mov [di], al
    inc di
    inc bx

    jmp find_replace_loop

update_source_index:
    add bx, cx  ; Skip past matched targetString in sourceString
    jmp find_replace_loop

end_program:
    ; Null-terminate the result string
    mov [di], '$'

    ; Display the modified string
    lea dx, resultString
    call mydisp

    ; Exit
    mov ah, 4Ch
    int 21h

; Procedure declarations
mydisp proc
    mov ah, 09h
    int 21h
    ret
mydisp endp

code ends
end start
