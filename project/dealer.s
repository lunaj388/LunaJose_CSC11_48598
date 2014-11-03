dealer
Dealers_card1:
	bl rand 						@ Call rand
	mov r1,r0,asr #1 				@ In case random return is negative
	mov r2,#11 						@ Move 11 to r2
									@ We want rand()%11+1 so cal division function with rand()%11
	bl division						@ Call division function to get remainder
	add r1,#1 						@ Remainder in r1 so add 1 giving between 1 and 11
	mov r7, r1
	ldr r0, address_of_message5		@ Set message5 as the first parameter of printf
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
	ldr r0, address_of_message6		@ Set message6 as the first parameter of printf
	bl printf 			
	bl Dealers_Total
	.global Dealers_Total

Dealers_Total:
		add r7, r7, r8
		mov r1, r7
		ldr r0, address_of_message3
		bl printf