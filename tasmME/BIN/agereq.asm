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
	
	agePrompt DB "What is your age? $"
	
	age DB 0
	resMsg DB " is a cool age: $"
	voteMsg DB " ... and you can vote! $"
	nonvoteMsg DB "... and you can make your parents pay for food!$"
	childMsg DB "You are only a child...$"
	teenMsg DB "You are a teenager...$"
	adultMsg DB "You are not a child...$"
	
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
			LEA DX,agePrompt
			INT 21h
			
			CALL InputDecByte
			MOV DL,AL			
			CALL PrintNewLine
			CALL PrintDecByte
			MOV AL,DL
			MOV AH,9
			LEA DX,resMsg
			INT 21h
			
			
			
			CMP AL,14
			JL Child
			JGE NonChild
			
			Child:
			
				CALL PrintNewLine
				MOV AH,9
				LEA DX,childMsg
				INT 21h
				CALL PrintNewLine
				MOV AH,9
				LEA DX,nonvoteMsg
				INT 21h
				JMP Exit
			
			NonChild:
				
				CMP AL,19
				JLE Teenager
				JG Adult
			
			Teenager:
			
				CALL PrintNewLine
				MOV AH,9
				LEA DX,teenMsg
				INT 21h
				
				CMP AL,18
				JGE Voter
				
				CALL PrintNewLine
				MOV AH,9
				LEA DX,nonvoteMsg
				INT 21h
				JMP Exit
				
			Adult:
			
				CALL PrintNewLine
				MOV AH,9
				LEA DX,adultMsg
				INT 21h
				
			Voter:
			
				CALL PrintNewLine
				MOV AH,9
				LEA DX,voteMsg
				INT 21h
			
			Exit:		
			MOV AH, 4Ch
			XOR AL, AL ; XOR makes null- flushes
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	