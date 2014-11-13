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
  color DB 5

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
   MOV BL,5
   MOV color,BL
   MOV color,5
   
   MOV BL,1
   MOV DX,0
LoopStart:
	PUSH AX
	
	Conta:
	
	Cont:
	POP BX
	INC DX
  	PUSH DX
	PUSH BX
	
	CALL WaitN
	POP BX
	POP DX
	POP AX
	;CALL FillScreen
	CALL DrawVerticalBar
	CMP DX,319
	JL LoopStart
	
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
	
		MOV DI,00000h
		MOV CX,320*200
	
		FillScreenLoopf:
			MOV BYTE PTR [DI],3
			ADD DI,1
			LOOP FillScreenLoopf
	
		POP DS
	
		RET
FillScreen ENDP
 DrawVerticalBar PROC
 	PUSH DS
 		;CALL TabClick
 		JMP Onwards
 		
 		Onwards:
		MOV AX,0A000h
		MOV DS,AX
	
		MOV DI,DX
		MOV CX,1*200
	
		FillScreenLoopb:
			PUSH AX
			;MOV AH,0Bh
			;INT 21h
			;CMP AX,0
			;JE ReturnBackb
			XOR AX,AX
			MOV AH,08h
			INT 21h
			CMP AX,0
			JE ReturnBacka
			MOV AH,08h
			INT 21h
			CMP AL,09h
			JNE ReturnBacka
	
			JMP IncreaseColor
			
 			
			ReturnBacka:
			MOV AL,color
			MOV color,AL
			JMP ReturnBackb
			IncreaseColor:
 			MOV AL,color
 			ADD AL,20
 			MOV color,AL
			ReturnBackb:
			MOV BYTE PTR [DI],AL
			
			ADD DI,320
			POP AX
			LOOP FillScreenLoopb

	
		POP DS
	
		RET
DrawVerticalBar ENDP
TabClick PROC
	PUSH AX
	MOV AH,0bh
	INT 21h
	CMP AL,0
	JE ReturnBack
	MOV AH,08h
	INT 21h
	MOV AH,08h
	INT 21h
	CMP AL,09h
	JNE ReturnBack
	
	JMP IncreaseColor
ReturnBack:
	XOR AX,AX
	POP AX
	RET
TabClick ENDP
MyCode endS
End Start
