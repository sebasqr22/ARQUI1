# TAREA 1 - ARQUITECTURA DE COMPUTADORES 💻

## PASOS PREVIOS
Se debe comenzar por instalar una versión del programa [RIPES](https://github.com/mortbopet/Ripes/releases)


&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 



## COMPRESIÓN DEL ARCHIVO **T1_SebastianDeJesusQuesadaRojas.s** 📁
### Definición de parámetros
En esta sección del archivo, se define el valor inicial de la semilla, que es la letra R que según el código ASCII es 82 en decimal, teniendo entonces el valor en hexadecimal de 0x52 (esto se almacena en el registro **a0**). Posteriormente se carga la posición de memoria en el registro a1, para que posteriormente utilizando la instrucción [sw](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#sw) se almacene en la posición **0x100** de memoria el valor inicial de la semilla. Luego se inicia el contador en 0 en el registro a2 y guarda el valor máximo de ciclos en el registro **a3**.

&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 

### CICLO LSFR 💾 
-> EXTRACCIÓN DE LOS BITS CON ANDS <-
Se debe extraer los bits 8, 6, 5 y 4, por lo que se utiliza operaciones ands para esto. Se utiliza la instrucción [andi](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#andi), seleccionado alguno de los registros t0, t1, t2 o t3 para almacenar cada bit.

-> CORRIMIENTO DE BITS PARA EL MENOS SIGNIFICATIVO <-
Con la operación [srli](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#srli) se corren los bits al bit menos significativo, para posteriomente hacer el cálculo del xor.

-> OPERACIONES XOR ENTRE BITS <-
Teniendo todos los números en los registros antes mencionados, se procede con el cálculo usando la instrucción [xor](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#xor)

-> ULTIMO PASOS <-
Primero se hace un corrimiento del resultado del xor al primer bit de la cadena, luego se le hace un shift a la semilla y con una operación [or](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#or) se agrega este bit al inicio de la semilla.

&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 

### CICLO VERIFICACIÓN 👨🏻‍💻
Primero se suma uno al contador y 4 a la posición de memoria en los registros antes mencionados. Se verifica si el contador es menor al máximo de ciclos con la instrucción [blt](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#blt). Si lo anterior no se cumple, se pasa al ciclo de end que termina el programa.

&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 

## CORRIDA DEL PROGRAMA
Se comienza por abrir RIPES y se abre el archivo **T1_SebastianDeJesusQuesadaRojas.s** y se verá de la siguiente manera:
<img width="1440" alt="Captura de pantalla 2024-02-26 a la(s) 4 22 54 p  m" src="https://github.com/sebasqr22/ARQUI1/assets/63075293/1e010b89-0f67-485c-89f9-f0f1f9601d75">

Se ubica el botón verde de correr el programa y una vez termine, se podrá observar el valor final en el registro **a0**, ubicado en la parte más derecha de la ventana:

<img width="410" alt="Captura de pantalla 2024-02-26 a la(s) 4 29 25 p  m" src="https://github.com/sebasqr22/ARQUI1/assets/63075293/0580ab40-79af-421a-82bc-b53c881881e4">
