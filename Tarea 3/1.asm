        org     100h

        section .text
                XOR DI, DI ; Limpiando registros
                XOR SI, SI ; 
                MOV word CX, 8d ; 
                XOR AX, AX
                jmp iterar ; 
        
        iterar: 
                MOV byte AL, [car+DI]
                MOV byte [200h+SI], AL
                MOV AH, [200h+SI]
                XOR AH, 48d
                ADD BL, AH
                INC DI
                INC SI
                LOOP iterar
                XOR AX, AX
                MOV Al, BL
                MOV BX, 08h
                DIV BL
                MOV [20Ah], BL
        exit:
                int 20h

        section .data

        car DB "00014718"