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
	booMsg DB "Boo!$"
	timeMsg DB "The time is: $"
	
MyData endS

; === CODE SEGMENT ===
MyCode segment
	Assume CS:MyCode,DS:MyData
	
	; === INCLUDE DIRECTIVES ===
	include CONIO.INC
	include TIME.INC
	; === PROCEDURES ===
	Main PROC ; marks beginning of a procedure
		Start:
			MOV AX, MyData
			MOV DS, AX
			
			; --- Insert your program's initial code here ---
			
			MOV AH,2Ch
			INT 21h
			PUSH DX

			MOV DX,0
			ADD DL,CH
			CALL PrintDecByte
			
			MOV AH,2
			MOV DX,':'
			INT 21h
			
			MOV DX,0
			ADD DL,CL
			CALL PrintDecByte
			
			MOV AH,2
			MOV DX,':'
			INT 21h
			POP DX
			MOV AX,0
			ADD AH,DH
			
			SUB AX,511
			MOV DX,AX
			CALL PrintDecWord
			
			MOV AH,2
			MOV DX,':'
			INT 21h
			
			CALL PrintDecByte
			
			MOV AH,2Ch
			INT 21h
			
			MOV AH,0
			MOV AL,0
			MOV BH,1
			MOV BL,50
			
			CALL AddTimes
			DELAYLOOP:
				PUSH AX
				MOV AH,2Ch
				INT 21h
				POP AX
				
			CALL CmpTimes
			
			JG DELAYLOOP
			
			MOV AH,9
			LEA DX,booMsg
			INT 21h
				
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	