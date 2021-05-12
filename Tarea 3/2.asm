org     100h

        section .text
                XOR DI, DI ; limpiando registro DI
                XOR SI, SI ; limpiando registro SI
                MOV word CX, 5d ; 
                MOV AX, 1d
                jmp iterar ; 
        
        iterar: 
                MOV BX, CX
                MUL BX
                LOOP iterar
        exit:
            int 20h