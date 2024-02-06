;8085

start:
    lxi h,5000
    mvi d,00
    mov c,m
    dcr c
    inx h

loop: 
    mov a,m 
    inx h 
    cmp m 
    jc skip
    jz skip
    mov b, m 
    mov m, a
    dcx h 
    mov m,b 
    inx h 
    mvi d,01 
    
skip: 
    dcr c
    jnz loop
    mov a,d 
    cpi 01 
    jz start
    hlt

