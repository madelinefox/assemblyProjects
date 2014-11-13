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
	
	numReq DB "Please give me two numbers $"
	numtReq DB "Please give me three numbers $"
	
	
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
			LEA DX,numReq
			INT 21h
			
			CALL InputDecByte
			MOV DX,0
			MOV DX,AX
			PUSH DX
				CALL InputDecByte
				MOV DX,AX
				PUSH DX
				POP DX
			CALL PrintDecByte
			POP DX
			CALL PrintDecByte
			CALL PrintNewLine
			;Excersize two
			
			MOV AH,9
			LEA DX,numtReq
			INT 21h
			CALL PrintNewLine
			CALL InputDecByte
			MOV DX,0
			MOV DX,AX
			PUSH DX
				CALL InputDecByte
				MOV DX,AX
				PUSH DX		
				CALL InputDecByte
				MOV DX,AX
					PUSH DX
					POP DX
				CALL PrintDecByte
				POP DX
			POP DX
			CALL PrintDecByte
			
			
			;Exersize three
			;
			CALL PrintNewLine
			MOV AH,9
			LEA DX,numReq
			INT 21h
			
			CALL InputDecByte
			MOV DX,0
			MOV DX,AX
			PUSH DX
				CALL InputDecByte
				
			CALL PrintNewLine	
				
			POP DX
			SUB DX,AX
			
			CALL PrintDecByte
			
			
			
			
			
			
								
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	