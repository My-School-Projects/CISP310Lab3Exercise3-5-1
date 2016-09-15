; General comments
; Author:  
; Date: 
; This is the Visual Studio 2012/Visual C++ Express Edition 2012 version   

; Preprocessor directives
.586		; use the 80586 set of instructions
.MODEL FLAT	; use the flat memory model (only 32 bit addresses, no segment:offset)

; External source files
INCLUDE io.h   ; header file for input/output

; Stack configuration
.STACK 4096	   ; allocate 4096 bytes for the stack

; Named memory allocation and initialization
.DATA
number   DWORD ?
prompt1   BYTE  "Enter first number", 0
prompt2   BYTE  "Enter second number", 0
string    BYTE  40 DUP (?)
resultLbl BYTE  "The sum is", 0
sum       BYTE  11 DUP (?), 0

; procedure definitions
.CODE
_MainProc PROC
	input  prompt1,   string, 40	; display promt1 and read input into string
	atod   string					; convert string to integer
	mov    number,    eax			; store resulting integer at number

	input  prompt2,   string, 40	; display prompt2 and read input into string
	atod   string					; convert string to integer

	add    eax,       number		; add first input to second input
	dtoa   sum,       eax			; convert result to ASCII and store it at sum
	output resultLbl, sum			; output sum

    mov     eax, 0					; exit with return code 0
    ret
_MainProc ENDP

END   ; end of source code