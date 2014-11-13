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

	numReq DB "Please give me two numbers $"
	numtReq DB "Please give me three numbers $"


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

			MOV AH,0
   MOV AX,13h
   INT 10h

			PUSH DS
			MOV AX,0A000h
			MOV DS,AX
	MOV BL,1
			MOV DI,DX
			MOV CX,320*200


		FillScreenLoopb:
			CALL Pause
			MOV AH,08h
			INT 21h
			MOV AH,08h
			INT 21h
			MOV BYTE PTR [DI],BL
			CMP AL,48h
			JE Up
			CMP AL,09h
			JE Tab
			CMP AL,50h
			JE Down
			CMP AL,08h
			JE SpaceBar
			CMP AL,4Bh
			JE Left
			CMP AL,4dh
			JE Right
			CMP AL,1Bh
			JE Exit
			Up:
			SUB DI,320
			JMP Cont
			Down:
			ADD DI,320
			JMP Cont
			Left:
			SUB DI,1
			JMP Cont
			Tab:
			INC BL
			ADD DI,320
			JMP Cont
			SpaceBar:
			CALL FillScreen
			JMP Cont
			Right:
			INC DI
			Cont:
			LOOP FillScreenLoopb
	Exit:
		POP DS







			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		 FillScreen PROC
 	PUSH DS
		MOV AX,0A000h
		MOV DS,AX

		MOV DI,00000h
		MOV CX,320*200

		FillScreenLoopf:
			MOV BYTE PTR [DI],0
			ADD DI,1
			LOOP FillScreenLoopf

		POP DS

		RET
FillScreen ENDP
	MyCode endS
	End Start
