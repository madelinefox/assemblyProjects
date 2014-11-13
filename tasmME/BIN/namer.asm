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
	fnamePrompt DB "What is your first name? $"
	lnamePrompt DB "What is your last name? $"
	fnameBuffer DB "1234567890123"
	lnameBuffer DB "1234567890123"
	helloMsg DB "Ciao, $"
	commaMsg DB ", $"
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
			LEA DX,fnamePrompt
			INT 21h
			
			CALL PrintNewLine
			
			MOV AH,13
			LEA DX,fnameBuffer
			CALL InputStr
			
			CALL PrintNewLine
			
			MOV AH,9
			LEA DX,lnamePrompt
			INT 21h
			
			MOV AH,13
			LEA DX,lnameBuffer
			CALL InputStr
			
			CALL PrintNewLine
			
			MOV AH,9
			LEA DX,helloMsg
			INT 21h
			
			MOV AH,9
			LEA DX,lnameBuffer
			INT 21h
			
			MOV AH,9
			LEA DX,commaMsg
			INT 21h
			
			MOV AH,9
			LEA DX,fnameBuffer
			INT 21h
			
				
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	