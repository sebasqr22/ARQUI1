// R -> (82)10 -> (52)16 -> (0101 0010)2

// DEFINICION DE PARAMETROS
mov r0, #0x52        // valor inicial de la semilla
mov r1, #0x100       // carga posicion de memoria
str r0, [r1]          // almacena la semilla en la pos de mem
mov r2, #0           // inicia el contador
mov r3, #0x64        // limite maximo del algoritmo

lsfr:
	// EXTRACCION DE LOS BITS CON ANDS
	and r4, r0, #0x1        // bit 8 almacenado en r4
	and r5, r0, #0x4        // bit 6 almacenado en r5
	and r6, r0, #0x8        // bit 5 almacenado en r6
	and r7, r0, #0x10       // bit 4 almacenado en r7

	// CORRIMIENTO DE BITS PARA EL MENOS SIGNIFICATIVO
	lsr r5, r5, #2
	lsr r6, r6, #3
	lsr r7, r7, #4

	// OPERACIONES XOR ENTRE BITS
	eor r8, r4, r5
	eor r8, r8, r6
	eor r8, r8, r7

	// ULTIMO PASOS
	lsl r8, r8, #7         // corrimiento del xor al primer bit
	lsr r0, r0, #1         // shift a la semilla para insertar res del xor
	orr r0, r0, r8          // agrega el res con una operacion or

verificacion:
	add r2, r2, #1          // suma uno al contador
	add r1, r1, #4          // suma 4 a la pos de memoria
	str r0, [r1]          // almacena el nuevo valor en memoria
	cmp r2, r3             // verifica si se debe hacer otro ciclo
	bgt end                // salta al ciclo end

end:
	nop                     // instruccion nop
