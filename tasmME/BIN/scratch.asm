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
   
	POP AX		
	MOV AH,0
	MOV AL,03h
	INT 10h


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


  ExitA:
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
			MOV BYTE PTR [DI],1
			ADD DI,1
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
			MOV BYTE PTR [DI],BL
			ADD DI,320
			LOOP FillScreenLoopb
	
		POP DS
	
		RET
DrawVerticalBar ENDP
MyCode endS
End Start
