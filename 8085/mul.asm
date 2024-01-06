    mvi d,00
    mvi a,00
    lxi h,4000
    mov b,m
    inx h
    mov c,m
loop: add b
    jnc next 
    inr d
next: dcr c
    jnz loop
    sta 4200
    mov a,d 
    sta 4201
    hlt
