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
	include CONIO.INC
	; === PROCEDURES ===
	Main PROC ; marks beginning of a procedure
		Start:
			MOV AX, MyData
			MOV DS, AX
			
			; --- Insert your program's initial code here ---
			
			;MOV DX,1024 ; register DX now equals 0 (and DL and DH equal 0)
			;MOV DL,5 ; sets DL to five, now DX = five since combining low and high at this point yeilds 5
			;MOV DL,1024
			MOV DX,0
			MOV DL,27
			CALL PrintDecWord ; displays value of DX it displays what DL and DH yeild together
			
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	