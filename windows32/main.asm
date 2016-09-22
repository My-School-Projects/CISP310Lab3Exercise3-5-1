; Michael Dorst
; CISP 310
; Lab 3

; Preprocessor directives
.586		; use the 80586 set of instructions
.MODEL FLAT	; use the flat memory model (only 32 bit addresses, no segment:offset)

; External source files
INCLUDE io.h   ; header file for input/output

; Stack configuration
.STACK 4096	   ; allocate 4096 bytes for the stack

; Named memory allocation and initialization
.DATA
number1   DWORD 0							; will store the first input in signed integer form
number2   DWORD 0							; will store the second input in signed integer form
prompt1   BYTE  "Enter first number", 0		; will be displayed in the pop-up window the first time the user is prompted for input
prompt2   BYTE  "Enter second number", 0	; will be displayed in the pop-up window the second time the user is prompted for input
prompt3   BYTE  "Enter third number", 0		; will be displayed in the pop-up window the third time the user is prompted for input
string    BYTE  40 DUP (0)					; will temporarily store the ASCII values of the user's input
											; before they are converted to integer values
											; the input macro will put 40 ASCII coded bytes into memory,
											; so we need 40 bytes of memory space to hold the input.
resultLbl BYTE  "The sum is", 0				; will be displayed in the pop-up window upon outputting the sum
sum       BYTE  11 DUP (0), 0				; will hold the ASCII value of the final sum before it is
											; displayed to the user
											; the longest possible value (in terms of decimal coded digits including sign)
											; is -2147483648, which is 11 characters long as a string.
											; because of this, the output macro expects exactly 11 bytes of ASCII coded text, so
											; sum must be 11 bytes long.

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
