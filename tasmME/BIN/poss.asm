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
  check DW 00000

MyData endS

; === CODE SEGMENT ===
MyCode segment                                  ; Sets up the segment names for
 Assume CS:MyCode,DS:MyData                     ;   the code and data segments.
 
 ; === INCLUDE DIRECTIVES ===
 include CONIO.INC
 include TIME.INC
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
  
;  MOV DX,0
;LoopStart:  
;  INC DX
;  CALL WaitN
 ; CALL FillScreen
;  CALL DrawVerticalBar
;  CMP DX,320
;  JLE LoopStart
  
  
  
  ;MOV DX,0
 ; MOV AX,check
	
SurroundLoop:
	PUSH AX
	CALL WaitN
	POP AX
	CMP check,319
	JE EXITA
	MOV AX,0
	MOV AX,check
	PUSH AX
	
	LoopStart:	
		POP AX
		CMP count,320
		JE ExitA
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
INC check
POP AX
JMP SurroundLoop
	POP DS
	POP AX
	
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
 WaitN PROC
			MOV AH,2Ch
			INT 21h
			
			MOV AH,0
			MOV AL,0
			MOV BH,0
			MOV BL,1
			
			CALL AddTimes
			DELAYLOOP:
				PUSH AX
				MOV AH,2Ch
				INT 21h
				POP AX
				
			CALL CmpTimes
			
			JG DELAYLOOP
			RET
		WaitN ENDP
 FillScreen PROC
 	PUSH DS
		MOV AX,0A000h
		MOV DS,AX
	
		MOV DI,DX
		MOV CX,320*200
	
		FillScreenLoopf:
			MOV BYTE PTR [DI],1
			ADD DI,320
			LOOP FillScreenLoopf
	
		POP DS
	
		RET
FillScreen ENDP
 DrawVerticalBar PROC
 	PUSH DS
		MOV AX,0A000h
		MOV DS,AX
	
		MOV DI,DX
		MOV CX,1*200
	
		FillScreenLoopb:
			MOV BYTE PTR [DI],2
			ADD DI,320
			LOOP FillScreenLoopb
	
		POP DS
	
		RET
DrawVerticalBar ENDP
MyCode endS
End Start
