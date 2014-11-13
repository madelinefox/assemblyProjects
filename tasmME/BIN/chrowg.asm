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
   
   MOV AH,0
   MOV AL,13h
   INT 10h
   
   PUSH DS
   
   MOV AX,0A000h
   MOV DS,AX
   
   MOV DI,00000h
   MOV CX,320*200
   ;$009F middle piece at top of screen
   FillScreenLoopd:
	 MOV BYTE PTR [DI],2
	INC DI
	LOOP FillScreenLoopd
	MOV AX,0A000h
   MOV DS,AX
   
   MOV DI,00000h
	 MOV CX,320*101
   ;$009F middle piece at top of screen
   FillScreenLoop:
	 MOV BYTE PTR [DI],1
	INC DI
	LOOP FillScreenLoop
	MOV AX,0A000h
   MOV DS,AX
   
   MOV DI,00000h
	 MOV CX,320*100
   ;$009F middle piece at top of screen
   FillScreenLoopa:
	 MOV BYTE PTR [DI],2
	INC DI
	LOOP FillScreenLoopa
	
	
	POP DS
	
	
	
	CALL Pause
	
			
	MOV AH,0
	MOV AL,03h
	INT 10h

  Exit:
   MOV AH, 4Ch                                  
   XOR AL, AL                                   
   INT 21h                                     
 Main ENDP
 DrawVerticalBar PROC
 	PUSH DS
		MOV AX,0A000h
		MOV DS,AX
	
		MOV DI,DX
		MOV CX,1*200
	
		FillScreenLoopb:
			MOV BYTE PTR [DI],BL
			ADD DI,320
			LOOP FillScreenLoopb
	
		POP DS
	
		RET
DrawVerticalBar ENDP
MyCode endS
End Start
