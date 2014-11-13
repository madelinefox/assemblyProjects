;
; ASM -- National Computer Camps
;
; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
  ; --- Declare your variables here ---
  nccMsg DB 07h,"National",0AH,09h,"Computer",0AH,09h,09h,"Camp$"
  gnote DW 784

MyData endS

; === CODE SEGMENT ===
MyCode segment                                  ; Sets up the segment names for
 Assume CS:MyCode,DS:MyData                     ;   the code and data segments.
 
 ; === INCLUDE DIRECTIVES ===
 include CONIO.INC
 include TIME.INC
 include SOUND.INC
 ; === PROCEDURES ===
Main PROC                                      ; Main procedure
  Start:                                        
   MOV AX, MyData                               ; Setup data segment;
   MOV DS, AX                                   ;   mucho importante!
  
   ; --- Insert your program's initial code here ---
   
   ; Print "Hello World" to the screen
   
   MOV BX,gnote
	CALL NoteQ
	CALL WaitT
   
   MOV AH,9                                     
   LEA DX,nccMsg
   INT 21h      
                      
    
                                  
  Exit:
   MOV AH, 4Ch                                  
   XOR AL, AL                                   
   INT 21h                                     
 Main ENDP
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
MyCode endS
End Start
