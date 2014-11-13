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
			MOV CL,AL
			
			MOV AH,9
			LEA DX,agePrompt
			INT 21h
			
			CALL InputDecByte
			MOV BL,AL ; SECOND OPERAND IS IN BL
			
			CALL PrintNewLine		
			MOV DL,CL
			CALL PrintDecByte ;FIRST OPERAND IS PRINTED
			MOV CL,DL ;FIRST OPERAND IS IN CL
				;
			MOV AH,2
			MOV DL,'*'  ;PRINTS A MULTIPLICATION SYMBOL
			INT 21h
			
			
			
			MOV DL,BL  ;MOVES SECOND OPERAND TO A PRINTABLE LOCATION
			CALL PrintDecByte
			MOV BL,DL ;second operand is back in bl
			
			MOV AH,2
			MOV DL,'='
			INT 21h
			
			;Multiplication here
			
			MOV AL,0
			ADD AL,CL
			MUL BL
			MOV DX,AX
			CALL PrintDecWord
			
			CALL PrintNewLine
			;Division here
			
			MOV DL,CL
			CALL PrintDecByte ;FIRST OPERAND IS PRINTED
			MOV CL,DL ;FIRST OPERAND IS IN CL
			
			MOV AH,2
			MOV DL,'/'
			INT 21h
			
			MOV DL,BL  ;MOVES SECOND OPERAND TO A PRINTABLE LOCATION
			CALL PrintDecByte
			MOV BL,DL ;second operand is back in bl
			
			MOV AH,2
			MOV DL,'='
			INT 21h
			
			MOV AX,0
			MOV AL,CL
			DIV BL
			
			MOV DL,AL
			CALL PrintDecByte
			
			MOV AH,2
			MOV DL,'R'
			INT 21h
			
			MOV DX,0
			MOV DH,AH 
			SUB DX,511
			CALL PrintDecWord
			
			
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	