.data 
A: .word 10000 #21
B: .word 5043 #19
P: .word 342 #13

.text 
.globl main

main: 
	lw $a0, A
	lw $a1, B
	lw $a2, P
	blt $a0, $a1, flip
	j Multiplication
	
flip:
	add $t9, $0, $a0
	li $a0, 0
	add $a0, $0, $a1
	li $a1, 0
	add $a1, $0, $t9

Multiplication:
	# $a0 - Multiplicand
	# $a1 - Multiplier
	# $v0 - Result
	# $t0 - The mask for the right bit
	# $t1 - The LSB of the multiplier

	li $v0, 0	# Initialize the result register
	#li $v1, 0
	li $t0, 1	# Initialize the mask 
	li $t1, 0	# Initialize the LSB result
	#li $t2, 0
	#li $t3, 0
	#li $t4, 0

	Multiplication_loop:
		beq $a1, $zero, Multiplication_end	# If the multiplier is zero we finished
		and $t1, $t0, $a1			# Get the LSB
		beq $t1, 1, Multiplication_do_add	# If the LSB is not zero add the multiplicand to the result
		beq $t1, 0, Multiplication_do_shift	# If the LSB is zero add just do the shifts

		Multiplication_do_add: 
			addu $v0, $v0, $a0	
			#mod starts here
			addu $t2, $0, $a0 
			addu $t4, $0, $a2 #move P to $t4
			addu $t3, $0, 1 #initialize mask to 1  
			blt $t4, $t2, modShift
			j findMod
			
		modShift:
			sll $t4, $t4, 1 #shift left p
			sll $t3, $t3, 1 #shift left mask
			blt $t4, $t2, modShift
			
		findMod:
			bge $t2, $t4, mod2
			j mod3
		mod2:
			subu $t2, $t2, $t4
			
		mod3:
			srl $t4, $t4, 1 
			srl $t3, $t3, 1 
			bne $t3, 0, findMod
			addu $v1 $v1, $t2

		Multiplication_do_shift:
			sll $a0, $a0, 1			# Shift left the multiplicand
			srl $a1, $a1, 1			# Shift right the multiplier

		j Multiplication_loop			# Back to the loop

	Multiplication_end:
		#jr $ra					# Return with the result in $v0 register
		j finalMod

	finalMod:
		addu $t2, $0, $v1
		addu $t4, $0, $a2 #move P to $t4
		addu $t3, $0, 1 #initialize mask to 1  
		blt $t4, $t2, modShift2

	modShift2:
			sll $t4, $t4, 1 #shift left p
			sll $t3, $t3, 1 #shift left mask
			blt $t4, $t2, modShift2
			
		findMod2:
			bge $t2, $t4, mod4
			j mod5
		mod4:
			subu $t2, $t2, $t4
			
		mod5:
			srl $t4, $t4, 1 
			srl $t3, $t3, 1 
			bne $t3, 0, findMod2
			addu $v1 $0, $t2


	add $a0,$v1,$0
	li $v0,1
	syscall
	li $v0,10		# Exit
	syscall
	
