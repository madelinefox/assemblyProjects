;
; Author: Madeline Fox
; Version: 1

; === STACK SEGMENT===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
	; --- Declare your variables here ---
	booMsg DB "3$"
	timeMsg DB "2 $"
	tMsg DB "1$"
	liftoff DB "LIFT OFF! $"
		
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
			
			MOV AH,9
			LEA DX,booMsg
			INT 21h
			CALL Wait
			MOV AH,9
			LEA DX,timeMsg
			INT 21h
			CALL Wait
			MOV AH,9
			LEA DX,tMsg
			INT 21h
			CALL Wait
			MOV AH,9
			LEA DX,liftoff
			INT 21h
				
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		Wait PROC
			MOV AH,2Ch
			INT 21h
			
			MOV AH,0
			MOV AL,0
			MOV BH,2
			MOV BL,0
			
			CALL AddTimes
			DELAYLOOP:
				PUSH AX
				MOV AH,2Ch
				INT 21h
				POP AX
				
			CALL CmpTimes
			
			JG DELAYLOOP
			RET
		Wait ENDP
	MyCode endS
	End Start
	
