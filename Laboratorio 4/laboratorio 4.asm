     org 100h

        section .text

        XOR SI, SI
        XOR AX, AX
        XOR BX, BX
        XOR CX, CX

        MOV CX, tam

        MOV DI, 0d

        MOV BP, 0d

        CALL    fun

        int     20h

        section .data

numeros  db  2,5,8,12,15,21,37,40,42,45
tam  equ $-numeros

Par:
        mov [0300h + BP], DL
        INC BP
        DEC CX
        jmp fun

Impar:
        mov [0320h + DI], DL
        INC DI
        DEC CX
        jmp fun

fun:
    
        MOV AL, [numeros + SI]
        MOV DL, [numeros + SI]

        MOV BL, 2d
        DIV BL

        INC SI
        CMP CX, 0d
        je fin
        CMP AH, 0d
        JP Par
        JNP Impar

        loop fun

fin:
        ret

        