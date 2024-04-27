.data
	# Inicializando 2 arreglos de 8 ceros
	arreglo1: .word 0:8 # input1
	arreglo2: .word 0:8 # input2
	arreglo3: .word 0:8 # output
	mensaje1: .asciiz "Inserta el primer elemento de 8 bits: \n"
	mensaje2: .asciiz "Inserta el segundo elemento de 8 bits: \n"
.text
	main:
	# Mensaje para insertar primer número
	li $v0, 4
	la $a0, mensaje1
	syscall
	
	# Guarda el primer numero en $t0
	li $v0, 5
	syscall
	move $t0, $v0
	
	
	# Mensaje para insertar segundo numero
	li $v0, 4
	la $a0, mensaje2
	syscall
	
	# Guarda el segundo numero en $t1
	li $v0, 5
	syscall
	move $t1, $v0
	
	addi $t2, $zero, 0 # Contador del while, i = 0
	addi $t3, $zero, 10000000 # Número que permite sacar ir particionando el número en unidades
	
	addi $t4, $zero, 160
	addi $t5, $zero, 192
	while:
		bgt $t2, 7, exit
		div $t0, $t3
		mflo $a1
		sw $a1, arreglo1($t4)
			addi $t4, $t4, 4
		mfhi $t0
		div $t1, $t3
		mflo $a2
		sw $a2, arreglo2($t5)
			addi $t5, $t5, 4
		mfhi $t0
		addi $t2, $t2, 1 # i++
		div $t3, $t3, 10 # constante = constante / 10
		j while
	exit:
		li $v0, 10
		syscall
	