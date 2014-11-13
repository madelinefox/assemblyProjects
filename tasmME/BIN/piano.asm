

; === STACK SEGMENT ===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData Segment
	; --- Declare Varibles here ---
	;//octave 1
	
	;//octave 2
	middlecnote DW 262 ;//q
	middlednote DW 294 ;//w
	middleenote DW 330 ;//e
	middlefnote DW 349 ;//r
	middlegnote DW 392 ;//t
	middleanote DW 440 ;//y
	middlebnote DW 494 ;u
	;octave 3
	gnote DW 784 ;//m
	fnote DW 698; //n
	enote DW 659 ;//b
	dnote DW 587 ;//v
	cnote DW 523 ; //c
	counter DW 0
	seccounter DW 0
	
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
		Recorder:
			CALL Pause	
			MOV AH,08h
			INT 21h
			CMP AL,0
			JE ReFormat
			INC counter
			INC seccounter
			PUSH AX
			JMP Recorder
			
		ReFormat:
			CMP counter,0
			JE Player
			DEC counter
			MOV AX,0
			POP AX
			MOV BX,0
			CMP AL,71h
			JE qchar
			CMP AL,77h
			JE wchar
			CMP AL,65h
			JE echar
			CMP AL,72h
			JE rchar
			CMP AL,74h
			JE tchar
			CMP AL,79h
			JE ychar
			CMP AL,75h
			JE uchar
			CMP AL,63h
			JE cchar
			CMP AL,76h
			JE vchar
			CMP AL,62h
			JE bchar
			CMP AL,6Eh
			JE nchar
			CMP AL,6Dh
			JE mchar
			
			
		Player:
			CMP seccounter,0
			JE Exiting
			DEC seccounter
			POP BX
			CALL NoteQ
			CALL WaitT
			JMP Player
			qchar:
			MOV BX,middlecnote
			PUSH BX
			JMP ReFormat
			wchar:
			MOV BX,middlednote
			PUSH BX
			JMP ReFormat
			echar:
			MOV BX,middleenote
			PUSH BX
			JMP ReFormat
			rchar:
			MOV BX,middlefnote
			PUSH BX
			JMP ReFormat
			tchar:
			MOV BX,middlegnote
			PUSH BX
			JMP ReFormat
			ychar:
			MOV BX,middleanote
			PUSH BX
			JMP ReFormat
			uchar:
			MOV BX,middlebnote
			PUSH BX
			JMP ReFormat
			cchar:
			MOV BX,cnote
			PUSH BX
			JMP ReFormat
			vchar:
			MOV BX,dnote
			PUSH BX
			JMP ReFormat
			bchar:
			MOV BX,enote
			PUSH BX
			JMP ReFormat
			nchar:
			MOV BX,fnote
			PUSH BX
			JMP ReFormat
			mchar:
			MOV BX,gnote
			PUSH BX
			JMP ReFormat
		Exiting:			
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
		 NoteW ENDP
		 
		NoteE PROC
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
			CALL WaitE
			POP AX
			POP DX
			
			OUT 42h,AL
			MOV AL,AH				
			OUT 42h,AL
			
			IN AL,61h
			AND AL,11111100b
			OUT 61h,AL
		 RET
		 NoteE ENDP
		 
		 
		 WaitE PROC
			MOV AH,2Ch
			INT 21h
			
			MOV AH,0
			MOV AL,0
			MOV BH,0
			MOV BL,13
			
			CALL AddTimes
			DELAYLOOPE:
				PUSH AX
				MOV AH,2Ch
				INT 21h
				POP AX
				
			CALL CmpTimes
			
			JG DELAYLOOPE
			RET
		WaitE ENDP 
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