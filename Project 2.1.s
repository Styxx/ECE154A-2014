####################
# Part D of Project 2 of ECE 154
####################

	    .data
N:	    .word 10						# number of test cases supplied; at least 10
A:	    .word 25,9,12345,54321,... 			# parameter A in (A^B) mod P; add 5 or more test cases
B:	    .word 16,8,54321,10000,... 			# parameter B in (A^B) mod P; add 5 or more test cases
P:	    .word 13,2,10000,65535,... 			# parameter P in (A^B) mod P; add 5 or more test cases
C:	    .word 1,1,1,1,1,... 				# results of test cases 
	    .globl main
	    .text
		
main:	    la  $s0, A                          # Load A array (base)
            la  $s1, B                          # Load B array (exponent)
            la  $s2, P                          # Load P array (mod)
            la  $t0, N                          
            lw  $s3, 0($t0)                     # Loading number of test cases
            add $s4, $0, $0                     # initialize i at 0
            la  $s5, C				# Load C array (results)
            
            # Past initialization
            
start:      #For each test case
            lw $t0, 0($s0) 			#Put A in $t0
            lw $t1, 0($s1)			#Put B in $t1
            lw $t2, 0($s2)			#Put C in $t2
            #Put result in $t3
                
            addi $s4, $0, 16                    # set bit counter to MSB
            addi $t8, $0, 32767                 # binary 1000 0000 0000 0000
            slt  $t9, $t8, $t1                  # is 32767 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 16383                 # binary 0100 0000 0000 0000
            slt  $t9, $t8, $t1                  # is 16383 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 8191                  # binary 0010 0000 0000 0000
            slt  $t9, $t8, $t1                  # is 8191 < exponent?
            bne  $t9, $zero, found1             # if so, move on

            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 4095                  # binary 0001 0000 0000 0000
            slt  $t9, $t8, $t1                  # is 4095 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 2047                  # binary 0000 1000 0000 0000
            slt  $t9, $t8, $t1                  # is 2047 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 1023                  # binary 0000 0100 0000 0000
            slt  $t9, $t8, $t1                  # is 1023 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 511                   # binary 0000 0010 0000 0000
            slt  $t9, $t8, $t1                  # is 511 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 255                   # binary 0000 0001 0000 0000
            slt  $t9, $t8, $t1                  # is 255< exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 127                   # binary 0000 0000 1000 0000
            slt  $t9, $t8, $t1                  # is 127 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 63                    # binary 0000 0000 0100 0000
            slt  $t9, $t8, $t1                  # is 63 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 31                    # binary 0000 0000 0010 0000
            slt  $t9, $t8, $t1                  # is 31 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 15                    # binary 0000 0000 0001 0000
            slt  $t9, $t8, $t1                  # is 15 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 7                     # binary 0000 0000 0000 1000
            slt  $t9, $t8, $t1                  # is 7 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 3                     # binary 0000 0000 0000 0100
            slt  $t9, $t8, $t1                  # is 3 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 1                     # binary 0000 0000 0000 0010
            slt  $t9, $t8, $t1                  # is 1 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t8, $0, 0                     # binary 0000 0000 0000 0001
            slt  $t9, $t8, $t1                  # is 0 < exponent?
            bne  $t9, $zero, expone             # if so, move on
            
expzero:    # If not, the exponent is 0
            addi $t6, $0, 1			# Make the result 1
            j RET

            
expone:     # If the exponent is 1
            # Result = base % mod
            slt   $t7,$a0,$a2             # set ($t7) to 1 if base < mod
            bne   $t7,$0,RET	          # if base < mod, move on
            sub   $a0,$a0,$a2             # else, subtract base by mod and repeat
            j expone

found1:     # Most significant 1 found
            # X = A (This has been done above) ($t0)
            # if (B[LSB == 1]) {Y = A}; else {Y = 1}
            # Find LSB of B ($t1)
            addi    $t9, $0, 1                          # $t9 = 1
            and     $t8, $t1, $t9                       # AND B with 1 to obtain LSB of B (in $t8)
            bne     $t8, $0, LSB1                       # if $t8 == 1, goto LSB1
            j       LSB0

LSB1:       add     $t6, $0, $t0                        # result = A (base)
	    j LOOP					# jumps to LOOP
LSB0:       addi    $t6, $0, 1                          # result = 1

LOOP:	    addi $t4, $s4, 0				# initializes counter 
			jal ummu					# jump and link to amumu (registers for X and P)
			srl $t1, $t1, 1				# implements shift to right
			and $t3, $t1, 1				# checks if bit is a 1
			bne $t3, $zero, BIS1			# checks value of $t3
			addi $t4, $t4, -1				# decrement counter
			slt $s7, $0, $t4				# check if for loop ends; if 0 < $t4, $s7 = 1
			bne $s7, $0, LOOP				# if 0 < $t4, then restart loop
			j RET					# if 0 = $t4, then end loop
	    
BIS1:		and $s8, $t6, 1					# check if y is odd
			beq $s8, $0, YIS0				# if y is 0
			bne $s8, $0, YIS1				# if y is 1
	    
YIS1:	    add $t6, $t0, $0				# if y is 1, set y = x
			j LOOP

YIS0:	    jal ummu					# if y is 0, y = y * x (mod m)
			j LOOP
	    
RET:	    # return y ($t6 for now)
			sw $t6, 0($s5)
			add $v1, $t6, $zero
			
			#increment test case counter ($s4)
			addi $s4, $s4, 4;
			
			##### Need to figure out how to go betwen test cases
			##### As well as figuring out when to stop after all test cases have been completed
			##### (N == $s4)
			
			
				# for (i = 0; i < 15; i++)
					# x = x * x % m
					# if (B[i] == 1)
						# if (y == 1) { y = x; }
						# else {y * x % m}
				#endfor
				#return y
            
            
#System end
		li $v0, 10
		syscall


ummu: 
Multiplication:
	# $a0 - Multiplicand
	# $a1 - Multiplier
	# $v0 - Result
	# $t0 - The mask for the right bit  $t5
	# $t1 - The LSB of the multiplier	$s6

	li $v0, 0	# Initialize the result register
	#li $v1, 0
	li $t5, 1	# Initialize the mask 
	li $s6, 0	# Initialize the LSB result
	#li $t2, 0	$t9
	#li $t3, 0	$s8
	#li $t4, 0	$s9

	Multiplication_loop:
		beq $a1, $zero, Multiplication_end	# If the multiplier is zero we finished
		and $s6, $t5, $a1			# Get the LSB
		beq $s6, 1, Multiplication_do_add	# If the LSB is not zero add the multiplicand to the result
		beq $s6, 0, Multiplication_do_shift	# If the LSB is zero add just do the shifts

		Multiplication_do_add: 
			addu $v0, $v0, $a0	
			#mod starts here
			addu $t9, $0, $a0 
			addu $t9, $0, $a2 #move P to $s9
			addu $t8, $0, 1 #initialize mask to 1  
			blt $t9, $t9, modShift
			j findMod
			
		modShift:
			sll $s9, $s9, 1 #shift left p
			sll $s8, $s8, 1 #shift left mask
			blt $s9, $t9, modShift
			
		findMod:
			bge $t9, $s9, mod2
			j mod3
		mod2:
			subu $t9, $t9, $s9
			
		mod3:
			srl $s9, $s9, 1 
			srl $s8, $s8, 1 
			bne $s8, 0, findMod
			addu $v1 $v1, $t9

		Multiplication_do_shift:
			sll $a0, $a0, 1			# Shift left the multiplicand
			srl $a1, $a1, 1			# Shift right the multiplier

		j Multiplication_loop			# Back to the loop

	Multiplication_end:
		#jr $ra					# Return with the result in $v0 register
		j finalMod

	finalMod:
		addu $t9, $0, $v1
		addu $s9, $0, $a2 #move P to $s9
		addu $s8, $0, 1 #initialize mask to 1  
		blt $s9, $t9, modShift2

	modShift2:
			sll $s9, $s9, 1 #shift left p
			sll $s8, $s8, 1 #shift left mask
			blt $s9, $t9, modShift2
			
		findMod2:
			bge $t9, $s9, mod4
			j mod5
		mod4:
			subu $t9, $t9, $s9
			
		mod5:
			srl $s9, $s9, 1 
			srl $s8, $s8, 1 
			bne $s8, 0, findMod2
			addu $v1 $0, $t9
	
	jr $ra
