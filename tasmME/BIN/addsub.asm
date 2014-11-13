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
	namePrompt DB "Enter first num$"
	agePrompt DB "Enter second num$"
	
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
			
			CALL InputDecByte
			MOV CL, AL ;CL is the first operand
			MOV AH,9
			LEA DX,agePrompt
			INT 21h
						
			CALL PrintNewLine
			CALL InputDecByte
			MOV BL, AL			;BL is the second operand
			CALL PrintNewLine
			
			MOV DL,0
			ADD DL,CL     ;BL currently stores the addition
			ADD DL,BL
			CALL PrintDecByte
			CALL PrintNewLine
			
			MOV DL,CL
			CALL PrintDecByte
			
			MOV CL,DL
			
			MOV AH,2
			MOV DL,'-'
			INT 21h
			
			MOV DL,BL
			CALL PrintDecByte
			
			SUB CL,DL
			
			MOV AH,2
			MOV DL,'='
			INT 21h
			
			MOV DL,CL
			
			CALL PrintDecByte
			
				
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	