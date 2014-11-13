

; === STACK SEGMENT ===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData Segment
	; --- Declare Varibles here ---
	hund DB 0
	sec DB 0
	gnote DW 784
	fnote DW 698
	enote DW 659
	dnote DW 587
	cnote DW 523
	bnote DW 466
	
	
MyData endS

; === CODE SEGMENT ===
MyCode segment
	Assume CS:MyCode,DS:MyData
	
	; === INCLUDE DIRECTIVES ===
	include CONIO.INC
	include TIME.INC
	include SOUND.INC
	; === PROCEDURES ===
	
	Main PROC
		Start:
			MOV AX, MyData
			MOV DS, AX
			
			; *** Inital Code Here ***
			
			
			
			MOV BX,enote
			CALL NoteQ
			CALL WaitT
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			MOV BX,cnote
			CALL NoteQ
			CALL WaitT
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			MOV BX,enote
			CALL NoteQ
			CALL WaitT
			MOV BX,enote
			CALL NoteQ
			CALL WaitT
			MOV BX,enote
			CALL NoteH
			CALL WaitT
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			MOV BX,dnote
			CALL NoteH
			CALL WaitT
			MOV BX,enote
			CALL NoteQ
			CALL WaitT
			MOV BX,gnote
			CALL NoteQ
			CALL WaitT
			MOV BX,gnote
			CALL NoteH
			CALL WaitT
			MOV BX,enote
			CALL NoteQ
			CALL WaitT
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			MOV BX,cnote
			CALL NoteQ
			CALL WaitT
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			MOV BX,enote
			CALL NoteQ
			CALL WaitT
			MOV BX,enote
			CALL NoteQ
			CALL WaitT
			MOV BX,enote
			CALL NoteQ
			CALL WaitT
			MOV BX,enote
			CALL NoteQ
			CALL WaitT
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			MOV BX,enote
			CALL NoteQ
			CALL WaitT
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			MOV BX,cnote
			CALL NoteQ
			CALL WaitT
			MOV BX,bnote
			Call NoteW
			
			
			
			
			
			; ***Closing program and returning to DOS***
			MOV AH, 4Ch
			XOR AL, AL
			INT 21h
		Main ENDP
		 NoteH PROC
		 MOV AL,0B6h				
			OUT 43h,AL
			
			IN AL,61h
			OR AL,00000011b
			OUT 61h,AL	
			
			MOV DX,0012h
			MOV AX,2870h
			DIV BX
			
			PUSH DX
			PUSH AX
			CALL WaitH
			POP AX
			POP DX
			
			OUT 42h,AL
			MOV AL,AH				
			OUT 42h,AL
			
			IN AL,61h
			AND AL,11111100b
			OUT 61h,AL
		 RET
		 NoteH ENDP
		 NoteQ PROC
		 MOV AL,0B6h				
			OUT 43h,AL
			
			IN AL,61h
			OR AL,00000011b
			OUT 61h,AL	
			
			MOV DX,0012h
			MOV AX,2870h
			DIV BX
			
			PUSH DX
			PUSH AX
			CALL WaitQ
			POP AX
			POP DX
			
			OUT 42h,AL
			MOV AL,AH				
			OUT 42h,AL
			
			IN AL,61h
			AND AL,11111100b
			OUT 61h,AL
		 RET
		 NoteQ ENDP
		 		 
		 NoteW PROC
		 MOV AL,0B6h				
			OUT 43h,AL
			
			IN AL,61h
			OR AL,00000011b
			OUT 61h,AL	
			
			MOV DX,0012h
			MOV AX,2870h
			DIV BX
			
			PUSH DX
			PUSH AX
			CALL WaitW
			POP AX
			POP DX
			
			OUT 42h,AL
			MOV AL,AH				
			OUT 42h,AL
			
			IN AL,61h
			AND AL,11111100b
			OUT 61h,AL
		 RET
		 NoteW ENDP
		 
		 
		 WaitH PROC
			MOV AH,2Ch
			INT 21h
			
			MOV AH,0
			MOV AL,0
			MOV BH,0
			MOV BL,50
			
			CALL AddTimes
			DELAYLOOPA:
				PUSH AX
				MOV AH,2Ch
				INT 21h
				POP AX
				
			CALL CmpTimes
			
			JG DELAYLOOPA
			RET
		WaitH ENDP
		WaitQ PROC
			MOV AH,2Ch
			INT 21h
			
			MOV AH,0
			MOV AL,0
			MOV BH,0
			MOV BL,25
			
			CALL AddTimes
			DELAYLOOPN:
				PUSH AX
				MOV AH,2Ch
				INT 21h
				POP AX
				
			CALL CmpTimes
			
			JG DELAYLOOPN
			RET
		WaitQ ENDP
		WaitW PROC
			MOV AH,2Ch
			INT 21h
			
			MOV AH,0
			MOV AL,0
			MOV BH,1
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
		WaitW ENDP
		WaitT PROC
			MOV AH,2Ch
			INT 21h
			
			MOV AH,0
			MOV AL,0
			MOV BH,0
			MOV BL,2
			
			CALL AddTimes
			DELAYLOOPQ:
				PUSH AX
				MOV AH,2Ch
				INT 21h
				POP AX
				
			CALL CmpTimes
			
			JG DELAYLOOPQ
			RET
		WaitT ENDP
		
		
MyCode endS
End Start