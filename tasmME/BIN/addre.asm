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
	address DB "Madeline Fox",13,10,"1160 Woods Circle NE",13,10,"Atlanta, GA 30324$"
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
			
			MOV AH,9
			LEA DX,address
			INT 21h
			
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	