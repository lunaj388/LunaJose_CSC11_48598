.data
 
message1: .asciz "Your first card is a %d\n"
message2: .asciz "Your second card is a %d\n"
message3: .asciz "Your total is %d\n"
message4: .asciz "Would you like a new card enter 1 for a new card anything else to exit\n\n"
message5: .asciz "Dealers first card is a %d\n"
message6: .asciz "Dealers second card is a %d\n"
message7: .asciz "Dealers second card is a %d\n"


format: .asciz "%d"

 
 .text
 
scaleRight:
	push {lr} 						@ Push lr onto the stack
		doWhile_r1_lt_r2: 			@ Shift right until just under the remainder
			mov r3,r3,ASR #1; 		@ Division counter
			mov r2,r2,ASR #1 		@ Mod/Remainder subtraction
			cmp r1,r2
			blt doWhile_r1_lt_r2
	pop {lr} 						@ Pop lr from the stack
	bx lr 							


addSub:
	push {lr} 						@ Push lr onto the stack
	doWhile_r3_ge_1:
		add r0,r0,r3
		sub r1,r1,r2
		bl scaleRight
		cmp r3,#1
		bge doWhile_r3_ge_1
	pop {lr}						 @ Pop lr from the stack
	bx lr 							 

	
scaleLeft:
	push {lr} 						@ Push lr onto the stack
		doWhile_r1_ge_r2: 			@ Scale left till overshoot with remainder
			mov r3,r3,LSL #1 		@ scale factor
			mov r2,r2,LSL #1 		@ subtraction factor
			cmp r1,r2
			bge doWhile_r1_ge_r2 	@ End loop at overshoot
	mov r3,r3,ASR #1 				@ Scale factor back
	mov r2,r2,ASR #1 				@ Scale subtraction factor back
	pop {lr} 						@ Pop lr from the stack
	bx lr							

	
division:
	push {lr} 						@ Push lr onto the stack
									@ Determine the quotient and remainder
	mov r0,#0
	mov r3,#1
	cmp r1,r2
	blt end
	bl scaleLeft
	bl addSub

end:
	pop {lr} 						@ Pop lr from the stack
	bx lr 							
		
 
 

	.global main
main:
	push {lr}	 					@ Push lr onto the top of the stack	
	mov r0,#0 						@ Set time(0)
	bl time 						@ Call time 
	bl srand 						@ Call srand
	
	mov r4,#0 						@ Setup loop counter

	.global card1
card1:	 							@ Create a random number
	bl rand 						@ Call rand
	mov r1,r0,asr #1 				@ In case random return is negative
	mov r2,#11 						@ Move 11 to r2
									@ We want rand()%11+1 so cal division function with rand()%11
	bl division						@ Call division function to get remainder
	add r1,#1 						@ Remainder in r1 so add 1 giving between 1 and 11
	mov r5, r1
	ldr r0, address_of_message1		@ Set message1 as the first parameter of printf
	bl printf 						@ Call printf	
	bl card2

	.global card2
card2:	 							@ Create a random number
	bl rand 						@ Call rand
	mov r1,r0,asr #1 				@ In case random return is negative
	mov r2,#11 						@ Move 11 to r2
									@ We want rand()%11+1 so cal division function with rand()%11
	bl division						@ Call division function to get remainder
	add r1,#1 						@ Remainder in r1 so add 1 giving between 1 and 11
	mov r6, r1
	ldr r0, address_of_message2		@ Set message2 as the first parameter of printf
	bl printf 						@ Call printf
	.global total
total:
		add r6, r6, r5
		mov r1, r6
		ldr r0, address_of_message3
		bl printf
		bl card3
		.global card3
card3:
	ldr r0, address_of_message4
	bl printf 
	
Dealers_card1:
	bl rand 						@ Call rand
	mov r1,r0,asr #1 				@ In case random return is negative
	mov r2,#11 						@ Move 11 to r2
									@ We want rand()%11+1 so cal division function with rand()%11
	bl division						@ Call division function to get remainder
	add r1,#1 						@ Remainder in r1 so add 1 giving between 1 and 11
	mov r7, r1
	ldr r0, address_of_message5		@ Set message1 as the first parameter of printf
	bl printf 						@ Call printf	
	bl Dealers_card2
	.global Dealers_card2

Dealers_card2:
	bl rand 						@ Call rand
	mov r1,r0,asr #1 				@ In case random return is negative
	mov r2,#11 						@ Move 11 to r2
									@ We want rand()%11+1 so cal division function with rand()%11
	bl division						@ Call division function to get remainder
	add r1,#1 						@ Remainder in r1 so add 1 giving between 1 and 11
	mov r8, r1
	ldr r0, address_of_message6		@ Set message1 as the first parameter of printf
	bl printf 						@ Call printf	
	bl Dealers_Total
	bl Dealers_Total

Dealers_Total:
		add r7, r7, r8
		mov r1, r8
		ldr r0, address_of_message3
		bl printf
		bl card3


	pop {lr} 						
	bx lr 							
 
 
 
 
 address_of_message1: .word message1
 address_of_message2: .word message2
 address_of_message3: .word message3
 address_of_message4: .word message4
 address_of_message5: .word message5
 address_of_message6: .word message6
 address_of_message7: .word message7


 address_of_format: .word format
									
 .global printf
 .global time
 .global srand
 .global rand