;
; ASM -- National Computer Camps
;
; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
  numPrompt1 DB "Number?","$"
  numPrompt2 DB "Number?","$"
  num1 DB "123456789"
  num2 DB "123456789"
  space DB " ","$"
  ; --- Declare your variables here ---
 
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
   MOV DS, AX 
   
   MOV AH,9
   LEA DX,numPrompt1				;Print "How old are you? ".
   INT 21h

   MOV AH,16					;Set AH = size of input buffer.
   LEA DX,num1				;Set DX = address of input buffer.
   CALL InputStr
   
   MOV AH,9
   LEA DX,numPrompt2				;Print "How old are you? ".
   INT 21h

   MOV AH,16					;Set AH = size of input buffer.
   LEA DX,num2				;Set DX = address of input buffer.
   CALL InputStr
   
   MOV AH,9
   LEA DX,num2				;Print the input buffer (which has the user’s name).
   INT 21h   ;Input the user’s name into the input buffer.
  
   MOV AH,9
   LEA DX,space				;Print "Hello ".
   INT 21h
   
   MOV AH,9
   LEA DX,num1				;Print the input buffer (which has the user’s name).
   INT 21h   ;Input the user’s name into the input buffer.
   
   ; --- Insert your program's initial code here ---

   MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
 Main ENDP
 
MyCode endS
End Start
