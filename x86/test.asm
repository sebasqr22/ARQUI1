; R -> (82)10 -> (52)16 -> (0101 0010)2

; DEFINICION DE PARAMETROS
mov eax, 0x52     ; valor inicial de la semilla
mov ebx, 0x100     ; carga posicion de memoria
mov [ebx], eax     ; almacena la semilla en la pos de mem
mov ecx, 0x0       ; inicia el contador
mov edx, 0x64       ; limite maximo del algoritmo

lsfr:
; EXTRACCION DE LOS BITS CON ANDS
and eax, 0x1        ; bit 8 almacenado en eax
and ebx, 0x4        ; bit 6 almacenado en ebx
and ecx, 0x8        ; bit 5 almacenado en ecx
and edx, 0x10       ; bit 4 almacenado en edx

; CORRIMIENTO DE BITS PARA EL MENOS SIGNIFICATIVO
shr ebx, 2
shr ecx, 3
shr edx, 4

; OPERACIONES XOR ENTRE BITS
xor esi, eax, ebx
xor esi, esi, ecx
xor esi, esi, edx

; ULTIMO PASOS
shl esi, 7          ; corrimiento del xor al primer bit
shr eax, 1          ; shift a la semilla para insertar res del xor
or eax, esi          ; agrega el res con una operacion or

verificacion:
add ecx, 1          ; suma uno al contador
add ebx, 4          ; suma 4 a la pos de memoria
mov [ebx], eax     ; almacena el nuevo valor en memoria
cmp ecx, edx       ; verifica si se debe hacer otro ciclo
jb lsfr             ; salta al ciclo lsfr
jmp end             ; salta al ciclo end

end:
nop                 ; instruccion nop
