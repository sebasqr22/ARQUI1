# R -> (82)10 -> (52)16 -> (0101 0010)2


start:
    # DEFINICION DE PARAMETROS
    li a0, 0x52          # valor inicial de la semilla
    li a1, 0x100         # carga posicion de memoria
    sw a0, 0(a1)         # almacena la semilla en la pos de mem
    li a2, 0x0           # inicia el contador
    li a3, 0x64          # limite maximo del algoritmo


lsfr:
    # EXTRACCION DE LOS BITS CON ANDS
    andi t0, a0, 0x1    # bit 8 almacenado en t0
    andi t1, a0, 0x4    # bit 6 almacenado en t1
    andi t2, a0, 0x8    # bit 5 almacenado en t2
    andi t3, a0, 0x10   # bit 4 almacenado en t3
    
    # CORRIMIENTO DE BITS PARA EL MENOS SIGNIFICATIVO
    srli t1, t1, 0x2
    srli t2, t2, 0x3
    srli t3, t3, 0x4
    
    # OPERACIONES XOR ENTRE BITS
    xor s1, t0, t1
    xor s1, s1, t2
    xor s1, s1, t3
    
    # ULTIMO PASOS
    slli s1, s1, 0x7    # corrimiento del xor al primer bit
    srli a0, a0, 0x1    # shift a la semilla para insertar res del xor
    or a0, a0, s1       # agrega el res con una operacion or
    

verificacion:
    addi a2,a2,0x1      # suma uno al contador
    addi a1,a1,0x4      # suma 4 a la pos de memoria
    sw a0,0(a1)         # almacena el nuevo valor en memoria
    blt a2,a3,lsfr      # verifica si se debe hacer otro ciclo
    j end               # salta al ciclo end


end:
    nop          
