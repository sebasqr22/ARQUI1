# R -> (82)10 -> (52)16 -> (0101 0010)2

start:
    li a0, 0xFF         # valor inicial de la semilla
    li a1,0x100         # carga posicion de memoria
    sw a0,0(a1)         # almacena la semilla en la pos de mem
    li a2,0x0           # inicia el contador
    li a3,0x64          # limite maximo del algoritmo


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
    xor t0, t1, s1
    xor s1, t2, s1
    xor s1, t3, s1
    
    # ULTIMO SHIFT
    srli a0, a0, 0x1
    or a0, a0, s1

check:
    addi a2,a2,0x1      # counter = counter + 1
    addi a1,a1,0x4      # mem_pos = mem_pos + 4
    sw a0,0(a1)         # [lsfr_value] -> M[mem_pos]
    blt a2,a3,lsfr      # counter < stop_count? -> lsfr
    j end               # else: go to end


end:
    nop                  # end algorithm