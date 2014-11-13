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
	     helloMsg DB "Hello World","$"
MyData endS

; === CODE SEGMENT ===
MyCode segment
	Assume CS:MyCode,DS:MyData
	
	; === INCLUDE DIRECTIVES ===
	 include CONIO.INC      ; Required in order to use the Pause function.
	; === PROCEDURES ===
	Main PROC
		Start:
			MOV AX, MyData
			MOV DS, AX
			
			; --- Insert your program's initial code here ---
			
			; Print "Hello World" to the screen
			MOV AH,0Fh
      		INT 10h              ; Save the initial screen mode (probably 03h) in AL.

     		 PUSH AX              ; Save AL.
      		 MOV AH,0
      		 MOV AL,13h
      		 INT 10h             ; Change the screen mode to 13h (the VGA Screen).
     		 POP AX               ; Restore AL.
      
    		  MOV AH,9
     		 LEA DX,helloMsg
     		 INT 21h              ; Print "Hello World".
      
      		CALL Pause           ; Wait for the user to press a key.
      
     		 MOV AH,0
    		  ; AL = the original
    		  ;      screen mode
      		INT 10h              ; Restore the original screen mode.

			MOV AH, 4Ch
			XOR AL, AL
			INT 21h
		Main ENDP
		
	MyCode endS
	End Start
	