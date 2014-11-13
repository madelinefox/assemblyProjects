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
			MOV DL,count
			LoopStart:
				CMP DL,10
				JGE LoopEnd
			
				CALL PrintDecByte
				INC DL
				JMP LoopStart
			LoopEnd:
				CMP DL,0
				JLE ExitOne
				
				CALL PrintDecByte
				DEC DL
				JMP LoopEnd
			
			ExitOne:
				CALL PrintNewLine
				
				MOV AH,9
				LEA DX,prompt
				INT 21h
				
				CALL InputDecByte
				MOV CL,AL
				CALL InputDecByte
				
				MOV DX,0
				ADD DL,CL
			LoopStartDuo:
				CMP DL,AL
				JGE LoopEndDuo
			
				CALL PrintDecByte
				INC DL
				JMP LoopStartDuo
			LoopEndDuo:
				CMP DL,CL
				JL ExitDuo
				
				CALL PrintDecByte
				DEC DL
				JMP LoopEndDuo
				
			ExitDuo:
				CALL PrintNewLine
				MOV AH,9
				LEA DX,promptTre
				INT 21h
				MOV CX,0
				MOV AX,0
				MOV DX,0
			LoopTreStart:
				CALL InputDecByte
				CMP AL,0
				JE LoopTreEnd
				
				ADD CL,AL
				JMP LoopTreStart
			LoopTreEnd:
				MOV DL,CL
				CALL PrintDecByte
					
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	