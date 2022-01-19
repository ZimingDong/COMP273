# Ziming Dong 260951177
		.data
String1:	.asciiz "Please enter a number: "
String2:	.asciiz "The answer is: "
		.text
main:	li $v0 4
	la $a0 String1
	syscall
	
	li $v0 5
	syscall
	
	add $a0 $v0 $zero
	jal Calculate
	add $s1 $v0 $zero
	
	li $v0 4
	la $a0 String2
	syscall
	
	li $v0 1
	add $a0 $zero $s1
	syscall
	
	j Exit
	
Calculate:	bgt $a0 1 Loop
		li $v0 1
		jr $ra
		
						
Loop:		addi $sp $sp -12
		sw $ra 0($sp)
		sw $a0 4($sp)
		
		addi $a0 $a0 -1
		jal Calculate
		sw $v0 8($sp)
		
		lw $a0 4($sp)
		addi $a0 $a0 -3
		jal Calculate
		lw $ra 0($sp)
		lw $t1 8($sp)
		add $v0 $v0 $t1
		addi $v0 $v0 1
		
		addi $sp $sp 12
		jr $ra
		
Exit:		li $v0 10
		syscall
	


