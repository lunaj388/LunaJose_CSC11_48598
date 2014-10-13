/*Jose Luna*/
.data
 
 /* Input Numerator */
 .balign 4
 message1: .asciz "Please type the numerator: "
 
  /* Input Denominator */
 .balign 4
 message2: .asciz "Please type the denominator: "
 
 /* Quotient Output */
 .balign 4
 message3: .asciz "Your Quotient is %d\n"
 
 /* Remainder Output */
 .balign 4
 message4: .asciz "Your Remainder is %d\n" 

 .balign 4
 scan_pattern: .asciz "%d"
 
 /* Where scanf will store the numbers read */
 .balign 4
 numerator_read: .word 0
 
 .balign 4
 demoninator_read .word 0
 
 .balign 4
 return: .word 0
 
 .balign 4
 return2: .word 0

 .balign 4
 return3: .word 0
 
 .text
 
 /* Division Function */
 division:
 LDR R1, address_of_return2           /* R1 <- address_of_return */
 STR LR, [R1]
 
 
 
    .global main
 main:
 	LDR R6, address_or_return			         /* R6 <- address_of_return */
 	STR LR, [R6]					                    /* R6 <- LR */
 
 
 
 	LDR R0, address_of_message1			       
 	BL printf					                       
 
 	LDR R0, address_of_scan_pattern		    /* R0 <- scan_pattern */
 	LDR R2, address_of_numerator_read			 /* R2 <- numerator */
 	BL scanf				                       	 /* call to scanf */
 	
 	@ Denominator Input
 	
 	LDR R0, address_of_message2			       /* R0 <- message2 */
 	BL printf					                       
 	
 	LDR R0, address_of_scan_pattern		    /* R0 <- scan_pattern */
 	LDR R3, address_of_denominator_read		/* R3 <- denomintator */
 	BL scanf				                       	 
 	
 	
  LDR R0, address_of_numerator_read    /* R0 <- numerator */
  LDR R1, address_of_denominator_read  /* R1 <- denominator */
  LDR R0, [R0]                         /* R0 <- R0 */
  LDR R1, [R1]                         /* R1 <- R1 */
  BL division                          /* Branchout to Division Funtion */
  
 
  
  MOV R4, R0                            /* r4 <- r0 */
  MOV R5, R1                            /* r5 <- r1 */
  LDR R2, address_of_numerator_read     /* r2 <- numerator */
  LDR R3, address_of_denominator_read   /* r3 <- denominator */
  LDR R2, [R2]                          /* r2 <- *r2 */
  LDR R3, [R3]                          /* r3 <- *r3 */
  LDR R0, address_of_message3           /* r0 <- message3 */
  LDR R1, address_of_message4           /* r1 <- message4 */
  BL printf
 
 
 
 LDR LR, address_of_return              /* lr <- address_of_return */
 LDR LR, [LR]                           /* lr <- *lr */
 BX LR                                  /* return from main using lr */
 
 
 address_of_message1: .word message1
 address_of_message2: .word message2
 address_of_message3: .word message3
 address_of_message4: .word message4
 address_of_scan_patter: .word scan_pattern
 address_of_numerator: .word numerator
 address_of_denominator: .word denominator
 address_of_return: .word return
 
 /* External */
 .global printf
 .global scanf