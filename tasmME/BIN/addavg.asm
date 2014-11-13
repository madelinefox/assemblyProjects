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
	namePrompt DB "Enter first num$"
	agePrompt DB "Enter second num$"
	thirdPrompt DB "Now enter a third num$"
	averageDisp DB " averages to $"
	fnum DB 0
	snum DB 0
	tnum DB 0
	sum DB 0
	
	
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
			
			MOV AH,9
			LEA DX,namePrompt
			INT 21h
			
			CALL InputDecByte	
			ADD sum,AL
			MOV fnum,AL
			
			MOV AH,9
			LEA DX,agePrompt
			INT 21h
			
			CALL InputDecByte
			ADD sum,AL
			MOV snum,AL 
			
			
			
			CALL PrintNewLine		
			
			MOV DL,fnum
			CALL PrintDecByte
			MOV fnum,DL
				
			MOV AH,2
			MOV DL,'+'
			INT 21h
			
			MOV DL,snum
			CALL PrintDecByte
			MOV snum,DL
			
			MOV AH,2
			MOV DL,'='
			INT 21h
			
			MOV DL,sum
			CALL PrintDecByte
			MOV sum,DL
			
			 ;MOVES SECOND OPERAND TO A PRINTABLE LOCATION
			
			
			CALL PrintNewLine
			
			MOV AH,9
			LEA DX,thirdPrompt
			INT 21h
			
			CALL InputDecByte
			ADD sum,AL
			MOV tnum,AL 
			
			
			CALL PrintNewLine
			
			MOV DL,fnum  ;moves fnum into DL to be printed
			CALL PrintDecByte
			MOV fnum,DL
			
			MOV AH,2
			MOV DL,'+'
			INT 21h
			
			MOV DL,snum  ;moves snum into DL to be printed
			CALL PrintDecByte
			MOV snum,DL
			
			MOV AH,2
			MOV DL,'+'
			INT 21h
			
			MOV DL,tnum  ;moves tnum into DL to be printed
			CALL PrintDecByte
			MOV tnum,DL
			
			MOV AH,2
			MOV DL,'='
			INT 21h
			
			MOV DL,sum
			CALL PrintDecByte
			MOV sum,DL
			
			MOV AH,9
			LEA DX,averageDisp ;prints out "averages to"
			INT 21h
			
			MOV AX,0
			MOV AL,sum;moves sum to al
			MOV CL,3; makes three be in a register
			DIV CL ; divides sum by 3
			
			MOV DL,AL ; moves quotient into dl to be printed
			CALL PrintDecByte
			
			
			
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	