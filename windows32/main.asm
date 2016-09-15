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
number1   DWORD ?
number2   DWORD ?
prompt1   BYTE  "Enter first number", 0
prompt2   BYTE  "Enter second number", 0
prompt3   BYTE  "Enter third number", 0
string    BYTE  40 DUP (?)
resultLbl BYTE  "The sum is", 0
sum       BYTE  11 DUP (?), 0

; procedure definitions
.CODE
_MainProc PROC
	input	prompt1,	string,	40	; display promt1 and read input into string
	atod	string					; convert string to integer
	mov		number1,	eax			; store resulting integer at number1

	input	prompt2,	string,	40	; display prompt2 and read input into string
	atod	string					; convert string to integer
	mov		number2,	eax			; store resulting integer at number2

	input	prompt3,	string,	40	; display prompt3 and read input into string
	atod	string					; convert string to integer
									; there is no need to store this integer,
									; because we will immediately add it to the second input.

	add		eax,		number2		; add third input to second input
									; (the third input is still stored in eax)
	add		eax,		number1		; add the first input to the previous sum
									; (the sum of the second and third inputs are stil stored in eax)
									; now the sum of the first, second and third inputs is stored in eax
	dtoa	sum,		eax			; convert result to ASCII and store it at the data location named "sum"
									; so that it can be displayed in the output window

	output	resultLbl,	sum			; output sum (from memory)

    mov		eax,		0			; exit with return code 0
    ret
_MainProc ENDP

END   ; end of source code
