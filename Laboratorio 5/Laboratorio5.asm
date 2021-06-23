org 100h

    section .text
    XOR AX, AX
    XOR SI, SI
    XOR BX, BX
    XOR CX, CX
    XOR DX, DX
 
    MOV SI, 0
    MOV DI, 0d
 
    MOV DH, 10 
    MOV DL, 20 
 
    CALL modotexto
 
    iteracion:
        CALL mover

        MOV CL, [cadenanombre+SI]
        
        CMP CL, " "

        JE cambioLinea

        CALL escribirLetra

        INC SI 
        INC DL 
        INC DI

        CMP DI, 31d

        JB ponerLinea

        JMP awanta
        
    cambioLinea:
        ADD DH, 2d
        MOV DL, 20
        INC SI
        INC DI
        CALL iteracion

    ponerLinea:
        CALL iteracion 

    modotexto:
        MOV AH, 0h 
        MOV AL, 03h 
        
        INT 10h
        RET

    mover:
        MOV AH, 02h 
        MOV BH, 0h

        INT 10h
        
        RET 

    escribirLetra:
        MOV AH, 0Ah 
        MOV AL, CL 
        MOV BH, 0h
        MOV CX, 1h

        INT 10h 

        RET

    awanta:
        MOV AH, 00h 

        INT 16h
    exit:
        INT 20h
 
    section .data
 
    cadenanombre DB 'Edith Yamilet Lopez Tobar'