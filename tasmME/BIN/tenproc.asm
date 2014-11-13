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
	
	promptTre DB "Okay, even more interesting, give me some numbers and type zero eventually$"
	prompt DB "Alright, now for something more interesting. Give me two numbers, first low, second high$"
	count DB 1
	
	
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
			MOV CX,1
			MOV AX,0
			MOV AL,10
			MOV DX,1
			CALL PrintNums
			
			
			
					
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		PrintNums PROC
				LoopStartDuo:
					CMP DL,AL
					JGE LoopEndDuo
			
					CALL PrintDecByte
					INC DL
					JMP LoopStartDuo
				LoopEndDuo:
					CMP DL,CL
					JL After
					
					CALL PrintDecByte
					DEC DL
					JMP LoopEndDuo
				After:
					RET
		PrintNums ENDP
	MyCode endS
	End Start
	