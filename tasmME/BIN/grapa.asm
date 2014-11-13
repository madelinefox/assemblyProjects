;
; ASM -- National Computer Camps
;
; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
  ; --- Declare your variables here ---
  prompt DB "Which letter? (0-25): $"
  alph DB "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

MyData endS

; === CODE SEGMENT ===
MyCode segment                                  ; Sets up the segment names for
 Assume CS:MyCode,DS:MyData                     ;   the code and data segments.
 
 ; === INCLUDE DIRECTIVES ===
 include CONIO.INC
 ; === PROCEDURES ===
Main PROC                                      ; Main procedure
  Start:                                        
   MOV AX, MyData                               ; Setup data segment;
   MOV DS, AX                                   ;   mucho importante!
  
   ; --- Insert your program's initial code here ---
   
   ; Print "Hello World" to the screen
   
   PUSH DS
   
   MOV AX,0B800h
   MOV DS,AX
   
   MOV DI,00000h
   MOV CX,1*80
   
   FillScreenLoop:
	 MOV BYTE PTR [DI],1
	 INC DI
	 INC DI
	LOOP FillScreenLoop
                     
    POP DX
  Exit:
   MOV AH, 4Ch                                  
   XOR AL, AL                                   
   INT 21h                                     
 Main ENDP
 
MyCode endS
End Start
