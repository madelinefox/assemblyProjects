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
  count DW 0
  check DW 160

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
  
  
  
MOV DX,0
CALL InputDecWord
PUSH AX
LoopStart:	
	POP AX
	CMP count,320
	JE EXITA
	INC count
	CMP count,AX
	JG Last
	JE Mid
	JL Beg
	Beg:
		PUSH AX
		MOV BL,2
		INC DX
		CALL DrawVerticalBar
		JMP LoopStart
	Mid:
		PUSH AX
		MOV BL,4
		INC DX
		CALL DrawVerticalBar
		JMP LoopStart
	Last:
		PUSH AX
		MOV BL,2
		INC DX
		CALL DrawVerticalBar
		CMP count,320
		JLE LoopStart
;	POP DS
	
	EXITA:
	
	CALL Pause
	
	POP AX		
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
