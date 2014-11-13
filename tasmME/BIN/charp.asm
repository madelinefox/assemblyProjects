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
	
MyData endS

; === CODE SEGMENT ===
MyCode segment
	Assume CS:MyCode,DS:MyData
	
	; === INCLUDE DIRECTIVES ===
	
	; === PROCEDURES ===
	Main PROC ; marks beginning of a procedure
		Start:
			MOV AX, MyData
			MOV DS, AX
			
			; --- Insert your program's initial code here ---
			
			MOV AH,2
			MOV DL,'A'
			INT 21h
			
			MOV DL,13
			INT 21h
			
			MOV DL,10
			INT 21h
			
			MOV DL,'B'
			INT 21h
			
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	