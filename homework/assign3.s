  .global main
 main:
 
     LDR R2, #111       
     MOV R3, #5            
     MOV R4, #0            
     MOV R5, #0		          
     MOV R6, #0		          
     MOV R7, #0		       
     MOV R8, #10	        
     MOV R9, #0		          
     MOV R10, #0          
     MOV R0, #0            
     MOVS R1, R2            @ R1=R2
     CMP R1, R3             @ Compare R1 to R3
     BGE scale              @ If R1 is greater than or equal to R3 go to scale
     BAL flag            
     
 scale:
     MOV R6, #1            @ Scale
     MUL R7, R3, R6        @ R7=R3*R6
     MUL R9, R7, R8        @ R9=R7*R8 
     BAL scalecomp

 scalecomp:    
     CMP R1, R9             @ Compares R1 to R9
     BGT inscale            @ Go to inscale
     BAL loop               @ Otherwise jump to loop
     
 inscale:
     MOV R10, R6           @ R10=R6
     MUL R6, R10, R8       @ R6=R6*R8
     MUL R7, R3, R6        @ R7=R3*R6
     MUL R9, R7, R8        @ R9=R7*R8
     BAL scalecomp
    
 loop:
     ADD R0, R0, R6         @ R0=R0+R6
     SUB R1, R1, R7         @ R1=R1-R7 
     CMP R1, R7             @Compare R1 to R7
     BGE loop               @ If R1 is greater than or Equal to R7 go back to loop
     BAL comploop
 
 comploop:
     CMP R6, #1             @ Compare R6 to 1
     BGT scale              @ back to scale
     BAL flag               
     
 flag:
     CMP R4, #0             @ Check if flag is set
     BEQ exit               @ set to 0 it will exit
     MOV R5, R0             @ R0 goes to R5
     MOV R0, R1             @ R1 goes to R0
     MOV R1, R5             @ R1=R5
     
 exit:
     BX LR