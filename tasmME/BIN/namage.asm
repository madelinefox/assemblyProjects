;
; ASM -- National Computer Camps
;

; === STACK SEGMENT===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
	; --- Declare your variables here ---
	namePrompt DB "What is your name? $"
	agePrompt DB "What is your age? $"
	nameBuffer DB "1234567890123"
	ageBuffer DB "123"
	helloMsg DB ", in ten years you will be $"
	
MyData endS

; === CODE SEGMENT ===
MyCode segment
	Assume CS:MyCode,DS:MyData
	
	; === INCLUDE DIRECTIVES ===
	include CONIO.INC
	; === PROCEDURES ===
	Main PROC ; marks beginning of a procedure
		Start:
			MOV AX, MyData
			MOV DS, AX
			
			; --- Insert your program's initial code here ---
			
			MOV AH,9
			LEA DX,namePrompt
			INT 21h
			
			CALL PrintNewLine
			
			MOV AH,13
			LEA DX,nameBuffer
			CALL InputStr
			
			CALL PrintNewLine
			
			MOV AH,9
			LEA DX,agePrompt
			INT 21h
			
			
			CALL InputDecByte
			
			
			
			CALL PrintNewLine
			
			;MOV AH,9
			;LEA DX,nameBuffer
			;INT 21h
			
			;MOV AH,9
			;LEA DX,helloMsg
			;INT 21h
			
			MOV DX,0
			ADD AL,10
			
			MOV DL,AL
			CALL PrintDecByte
			
			
			
				
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	