    mvi 4100h
start:
    lxi h,4000
    mov a,m 
    call display
    call delay
    mov a,m 
    adi 01 
    oaa
    jnz start


    mvi h,4000
    mov c,m
    mov a,01
loop: 
    call display
    call delay
    adi 01
    daa 
    cmp c
    jc loop
display:
    mvi a,02
    call 0005
    mvi a,0c
    mvi c,00
    mov d,m 
    call 0005
    ret
delay:
    lxi b,ffff
wait:
    dcx b
    ora b
    jnz wait
    ret