org 100h
    section .text
    mov DX,ingreso
    call ingresando
    mov BP,input

    call cadena
    call verificando
    call ingresando

    int     20h
    section .data
    clave DB "00014718"
    
    ingreso DB "Contraseña para ingresar: ", "$"
    ingresoEfectivo DB "Bienvenido", "$"
    ingresoDenegado DB "Incorrecto", "$"
    input times 20 DB " "

    awanta:
        mov AH,01h
        int 21h
        ret
    cadena:
        XOR SI,SI   
    while:
        call awanta
        cmp  AL,0x0D
        je   exit
        mov [BP+SI],AL
        inc SI
        jmp while
    exit:
        mov byte [BP+SI], "$"
        ret
    ingresando:
        mov AH,09h
        int 21h
        ret
    verificando:
        mov AL,[clave]
        mov AH,[input]
        cmp AL,AH
        je  bienvenido
        jne incorrecto
        ret
    bienvenido:
        mov     DX,ingresoEfectivo
        ret
    incorrecto:
        mov     DX,ingresoDenegado
        ret
    