

; === STACK SEGMENT ===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData Segment
	; --- Declare Varibles here ---
	hund DB 0
	sec DB 0
	hdnote DW 1175
	gnote DW 784
	fnote DW 698
	enote DW 659
	dnote DW 587
	cnote DW 523
	bnote DW 494
	anote DW 440
	lgnote DW 392	
	ldnote DW 294
	inword DB "In $"
	the DB "the $"
	jun DB "jun$"
	gle DB "gle $"
	might DB "might$"
	li DB  "li$"
	onword DB "on $"
	sleeps DB "sleeps $"
	to DB "to$"
	night DB "night $"
	qu DB "qu$"
	iet DB "iet $"
	We DB "We$"
	eee DB "eeee$"
	um DB "um $"
	bo DB "bo $"
	way DB "way $"
	
	
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
			
			MOV AH,9
			LEA DX,inword
			INT 21h
			
			MOV BX,lgnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,the
			INT 21h
			
			MOV BX,anote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,jun
			INT 21h
			
			MOV BX,bnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,gle
			INT 21h
			
			MOV BX,anote
			CALL NoteE
			CALL WaitT
			
			MOV AH,9
			LEA DX,the
			INT 21h
			
			MOV BX,bnote
			CALL NoteE
			CALL WaitT
			
			MOV AH,9
			LEA DX,might
			INT 21h
			
			MOV BX,cnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,2
			MOV DX,'y'
			INT 21h
			
			MOV BX,bnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,jun
			INT 21h
			
			MOV BX,anote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,gle
			INT 21h
			
			MOV BX,lgnote
			CALL NoteE
			CALL WaitT
			
			MOV AH,9
			LEA DX,the
			INT 21h
			
			MOV BX,anote
			CALL NoteE
			CALL WaitT
			
			MOV AH,9
			LEA DX,li
			INT 21h
			
			MOV BX,bnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,onword
			INT 21h
			
			MOV BX,anote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,sleeps
			INT 21h
			
			MOV BX,lgnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,to
			INT 21h
			
			MOV BX,bnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,night
			INT 21h
			
			MOV BX,anote
			CALL NoteW
			CALL WaitT
			
			MOV AH,2
			MOV DX,13
			INT 21h
			MOV AH,2
			MOV DX,10
			INT 21h
			MOV AH,9
			LEA DX,inword
			INT 21h	
					
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,the
			INT 21h
			
			MOV BX,bnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,jun
			INT 21h
			
			MOV BX,anote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,gle
			INT 21h
			
			MOV BX,bnote
			CALL NoteE
			CALL WaitT
			
			MOV AH,9
			LEA DX,the
			INT 21h
			
			MOV BX,dnote
			CALL NoteE
			CALL WaitT
			
			MOV AH,9
			LEA DX,qu
			INT 21h
			
			MOV BX,cnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,iet
			INT 21h
			
			MOV BX,bnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,jun
			INT 21h
			
			MOV BX,anote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,gle
			INT 21h
			
			MOV BX,lgnote
			CALL NoteE
			CALL WaitT
			
			MOV AH,9
			LEA DX,the
			INT 21h
			
			MOV BX,anote
			CALL NoteE
			CALL WaitT
			
			MOV AH,9
			LEA DX,li
			INT 21h
			
			MOV BX,bnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,onword
			INT 21h
			
			MOV BX,anote
			Call NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,sleeps
			INT 21h
			
			MOV BX,lgnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,to
			INT 21h
			
			MOV BX,bnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,night
			INT 21h
			
			MOV BX,anote
			CALL Notew
			CALL WaitT
			
			MOV AH,2
			MOV DX,13
			INT 21h
			MOV AH,2
			MOV DX,10
			INT 21h
			MOV AH,9
			LEA DX,We
			INT 21h
			
			MOV BX,hdnote
			Call NoteW
			CALL WaitT
			
			MOV AH,9
			LEA DX,eee
			INT 21h
			
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,eee
			INT 21h
			
			MOV BX,cnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,eee
			INT 21h
			
			MOV BX,dnote
			Call NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,eee
			INT 21h
			
			MOV BX,cnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,eee
			INT 21h
			
			MOV BX,bnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,We
			INT 21h
			
			MOV BX,ldnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,um
			INT 21h
			
			MOV BX,ldnote
			Call NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,um
			INT 21h
			
			MOV BX,ldnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,bo
			INT 21h
			
			MOV BX,ldnote
			Call NoteW
			CALL WaitT
			
			MOV AH,9
			LEA DX,way
			INT 21h
			
			MOV BX,hdnote
			Call NoteW
			CALL WaitT
			
			MOV AH,2
			MOV DX,13
			INT 21h
			MOV AH,2
			MOV DX,10
			INT 21h
			MOV AH,9
			LEA DX,We
			INT 21h
			
			MOV BX,dnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,eee
			INT 21h
			
			MOV BX,cnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,eee
			INT 21h
			
			MOV BX,dnote
			Call NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,eee
			INT 21h
			
			MOV BX,cnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,eee
			INT 21h
			
			MOV BX,bnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,We
			INT 21h
			
			MOV BX,ldnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,um
			INT 21h
			
			MOV BX,ldnote
			Call NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,um
			INT 21h
			
			MOV BX,ldnote
			CALL NoteQ
			CALL WaitT
			
			MOV AH,9
			LEA DX,bo
			INT 21h
			
			MOV BX,ldnote
			Call NoteW
			CALL WaitT
			
			MOV AH,9
			LEA DX,way
			INT 21h
			
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