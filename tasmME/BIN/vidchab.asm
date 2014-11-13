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
  helloMsg DB "You wanted an etch-a-sketch",13,10,"Go out of the campus onto peachtree industrial. Turn right.",13,10, "Turn left onto Roxboro and turn right into target. Go buy one$"
MyData endS

; === CODE SEGMENT ===
MyCode segment                                  ; Sets up the segment names for
 Assume CS:MyCode,DS:MyData                     ;   the code and data segments.
 
 ; === INCLUDE DIRECTIVES ===
 include CONIO.INC
 ; === PROCEDURES ===
Main PROC                                      ; Main procedure
  Start:                                        
   MOV AX, MyData                               ; Setup data segment;
   MOV DS, AX                                   ;   mucho importante!
  
   ; --- Insert your program's initial code here ---
   
   ; Print "Hello World" to the screen
  
  
  
   MOV AH,0
   MOV AX,13h
   INT 10h
   
   MOV AH,0
   MOV AX,05h
   INT 10h
   
   MOV AH,9                                     ; DOS-Service: Print string DX
   LEA DX,helloMsg                              ; DX -> helloMsg
   INT 21h                                      ; Invoke the DOS service
  
  
  
   MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
 Main ENDP
 
MyCode endS
End Start
