    org     200h

    section .text

    mov     BX, 200h

    mov     AX, "E"
    mov     CL, "Y"
    mov     DL, "L"
    mov     DH, "T"

    mov     [200h], AX
    mov     [201h], CL
    mov     [202h], DL
    mov     [203h], DH

    mov     AX, [200h]
    
    mov     Cl, [BX]

    mov     DL, [BX + SI]

    mov     DH, [DI + 100h]

    int     20h