
INCLUDE Irvine32.inc

.data
	; define variables

	Ipt1 db ?

	keyin db 10,13,"Insert input: ",0
	answer db 10,13,"Answer: ",0
	range db "Insert value within range 1 - 5: ",10,13,0


	list word 2,4,6,8,10
	list2 dword 2,4,6,8,10


	Err db 10,13, "*** Input error. Please try again***",10,13,10,13,0
	
	axreg db "AX = ",0
 	eaxreg db "EAX = " ,0

	MainMenu db 10,13, "MAIN MENU",10,13
	db "1.Chapter 4",10,13
	db "2.Chapter 7",10,13
	db "3.Exit",10,13
	db "Choose a number: ",0
	
	COMMENT @ ;------------------------------
	byebye db "Thank you, and goodbye!",10,13
	db "Thank you, and goodbye!",10,13
	db "Thank you, and goodbye!",10,13
	db "Thank you, and goodbye!",10,13
	db "Thank you, and goodbye!",10,13,0
	@ ;--------------------------------------

	byebye db "   ",10,13,10,13,10,13
    db "                 88888888888 888                        888                                     888 ",10,13
	db "                     888     888                        888                                     888 ",10,13
	db "                     888     888                        888                                     888 ",10,13
	db "                     888     88888b.   8888b.  88888b.  888  888     888  888  .d88b.  888  888 888 ",10,13
	db "                     888     888  88b      88b 888  88b 888 .88P     888  888 d88  88b 888  888 888 ",10,13
	db "                     888     888  888 .d888888 888  888 888888K      888  888 888  888 888  888 Y8P ",10,13
	db "                     888     888  888 888  888 888  888 888  88b     Y88b 888 Y88..88P Y88b 888     ",10,13
	db "                     888     888  888  Y888888 888  888 888  888       Y88888   Y88P    Y88888  888 ",10,13
    db "                                                                          888                       ",10,13
    db "                                                                     Y8b d88P                       ",10,13
    db "                                                                       Y88P                         ",10,13,10,13,0

.code
main PROC
	; codes

	mov edx, offset MainMenu
	call writestring ;display

	call readint


	.if (eax==1)
	jmp c4
	.elseif (eax==2)
	jmp c7
	.elseif (eax==3)
	jmp quit
	.else
	jmp errur
	.endif

	c4:
	call chapter4

	c7:
	call chapter7

	quit:
	call Clrscr
	mov edx, offset byebye
	call writestring
	exit

	errur:
	mov edx,offset Err
	call writestring
	call main

main ENDP


.data
	Chpt4 db 10,13, "CHAPTER 4",10,13
	db "1. Data Transfer Instructions",10,13
	db "2. Addition and Subtraction",10,13
	db "3. Data-Related Operators and Directives",10,13
	db "4. Addressing Modes",10,13
	db "5. JMP and LOOP Instructions",10,13
	db "6. Main Menu",10,13
	db "Choose a number: ",0

	four1 db 10,13, "4.1 Data Transfer Instructions",0
	four2 db 10,13, "4.2 Addition and Subtraction",0
	four3 db 10,13, "4.3 Data-Related Operators and Directives",0
	four4 db 10,13, "4.4 Addressing Modes",0
	four5 db 10,13, "4.5 JMP and LOOP Instructions",0

	Input1 dword ?
	Input2 dword ?

.code
chapter4 PROC
	;codes
	mov edx, offset Chpt4
	call writestring
	call readint

	.if (eax==1)
	jmp f1
	.elseif (eax==2)
	jmp f2
	.elseif (eax==3)
	jmp f3
	.elseif (eax==4)
	jmp f4
	.elseif (eax==5)
	jmp f5
	.elseif (eax==6)
	jmp f6
	.else
	jmp error
	.endif

	f1:
	call s41

	f2:
	call s42

	f3:
	call s43

	f4:
	call s44

	f5:
	call s45

	f6:
	call Clrscr
	call main

	error:
	mov edx,offset Err
	call writestring
	call chapter4

chapter4 ENDP

.data
	detail41 db 10,13, "4.1 Data Transfer Instructions",10,13
	db "1. MOV Instruction",10,13
	db "2. MOVZX Instruction",10,13
	db "3. MOVSX instruction",10,13
	db "4. XCHG instruction",10,13
	db "5. Direct-Offset Operand",10,13
	db "6. Back to Chapter 4",10,13
	db "7. Main Menu",10,13
	db "Choose a number: ",0

	movinst db 10,13, "MOV Instruction",10,13,0
	movzxin db 10,13,"MOVZX Instruction",10,13,0
	mov2x db 10,13,"MOVZX eax, ax",10,13,0
	mov5x db 10,13,"MOVSX instruction",10,13,0
	excg db 10,13,"XCHG instruction",10,13,0
	doff db 10,13,"Direct-Offset Operand",10,13,0

	arr db 10,13,"list word 2,4,6,8,10",10,13,0
	lst db "mov ax, list",0
	lst2 db "mov ax, list+2",0
	lst6 db "mov ax, list+6",0


.code
s41 PROC	;Data Transfer Instructions
	;codes

	mov edx, offset detail41
	call writestring
	call readint

	.if (eax==1)
	jmp f1
	.elseif (eax==2)
	jmp f2
	.elseif (eax==3)
	jmp f3
	.elseif (eax==4)
	jmp f4
	.elseif (eax==5)
	jmp f5
	.elseif (eax==6)
	jmp f6
	.elseif (eax==7)
	jmp f7
	.else
	jmp error
	.endif

	f1:
	; MOV Instructions---------------------
	call Clrscr
	mov edx, offset four1
	call writestring
	mov edx, offset movinst
	call writestring
	mov edx, offset keyin
	call writestring
	call readint

	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	call s41

	f2:
	; Zero Extension/ MOVZX Instructions----
	call Clrscr
	mov edx, offset four1
	call writestring	
	mov edx, offset movzxin
	call writestring
	mov edx, offset keyin
	call writestring
	call readint
	
	mov edx, offset mov2x
	call writestring
	call crlf

	movzx eax, ax

	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	mov edx, offset eaxreg
	call writestring
	call writebin
	call crlf
	call s41

	f3:
	; Sign Extension/ MOVSX Instructions
	call Clrscr
	mov edx, offset four1
	call writestring
	mov edx, offset mov5x
	call writestring
	call crlf

	mov edx, offset keyin
	call writestring
	
	call readint

	mov edx, offset answer
	call writestring
	movsx ax, al
	call writebin
	call crlf
	call s41

	f4:
	; XCHG Instructions
	call Clrscr
	mov edx, offset four1
	call writestring
	mov edx, offset excg
	call writestring

	mov edx, offset keyin
	call writestring
	call readint
	mov Input1, eax

	mov edx, offset keyin
	call writestring
	call readint
	mov Input2, eax
	call crlf

	mov eax, Input1
	mov ebx, Input2

	xchg eax, ebx

	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	call s41

	f5:
	;Direct-Offset Operands
	call Clrscr
	mov edx, offset four1
	call writestring
	mov edx, offset doff
	call writestring
	call crlf
	mov edx, offset arr
	call writestring

	;the codes
	mov edx, offset lst
	call writestring
	mov edx, offset answer
	call writestring
	mov ax, list				;list
	call writeint
	call crlf
	call crlf

	mov edx, offset lst2
	call writestring
	mov edx, offset answer
	call writestring
	mov ax, list+2				;list+2
	call writeint
	call crlf
	call crlf

	mov edx, offset lst6
	call writestring
	mov edx, offset answer
	call writestring
	mov ax, list+6				;list+6
	call writeint
	call crlf
	call s41

	f6:
	call Clrscr
	call chapter4

	f7:
	call Clrscr
	call main

	error:
	mov edx,offset Err
	call writestring
	call s41

s41 ENDP

.data
	detail42 db 10,13, "4.2 Addition and Subtraction",10,13
	db "1. INC Instruction",10,13
	db "2. DEC Instruction",10,13
	db "3. ADD Instruction",10,13
	db "4. SUB Instruction",10,13
	db "5. NEG Instruction",10,13
	db "6. Back to Chapter 4",10,13
	db "7. Main Menu",10,13
	db "Choose a number: ",0

	incre db 10,13,"INC Instruction",10,13,0
	decre db 10,13,"DEC Instruction",10,13,0
	addd db 10,13,"ADD Instruction",10,13,0
	subb db 10,13,"SUB Instruction",10,13,0
	negt db 10,13,"NEG Instruction",10,13,0

.code

s42 PROC	;Addition n Subtraction
	;codes
	
	mov edx, offset detail42
	call writestring
	call readint
	
	.if (eax==1)
	jmp f1
	.elseif (eax==2)
	jmp f2
	.elseif (eax==3)
	jmp f3
	.elseif (eax==4)
	jmp f4
	.elseif (eax==5)
	jmp f5
	.elseif (eax==6)
	jmp f6
	.elseif (eax==7)
	jmp f7
	.else
	jmp error
	.endif
	
	f1:
	; INC----------------------
	call Clrscr
	mov edx, offset four2
	call writestring
	mov edx, offset incre
	call writestring
	mov edx, offset keyin
	call writestring
	call readint
	
	inc eax						;inc

	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	call s42

	f2:
	;DECRE-----------------------------
	call Clrscr
	mov edx, offset four2
	call writestring
	mov edx, offset decre
	call writestring
	mov edx, offset keyin
	call writestring
	call readint

	dec eax						;dec

	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	call s42

	f3:
	; ADD-------------------
	call Clrscr
	mov edx, offset four2
	call writestring
	mov edx, offset addd
	call writestring
	call crlf

	mov edx, offset keyin
	call writestring
	call readint
	mov ebx, eax

	mov edx, offset keyin
	call writestring
	call readint
	call crlf

	add eax, ebx					;add

	mov edx, offset answer
	call writestring
	call writeint
	call crlf
	call s42

	f4:
	;SUB--------------------------------
	call Clrscr
	mov edx, offset four2
	call writestring

	mov edx, offset subb
	call writestring
	call crlf

	mov edx, offset keyin
	call writestring
	call readint
	mov Input1, eax

	mov edx, offset keyin
	call writestring
	call readint
	mov Input2, eax

	mov eax, Input1
	mov ebx, Input2
	
	sub eax, ebx					;sub

	mov edx, offset answer
	call writestring
	call writeint
	call crlf
	call s42

	f5:
	; NEG---------------------------
	call Clrscr
	mov edx, offset four2
	call writestring
	mov edx, offset negt
	call writestring
	mov edx, offset keyin
	call writestring
	call readint

	neg eax						;neg

	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	call s42

	f6:
	call Clrscr
	call chapter4

	f7:
	call Clrscr
	call main

	error:
	mov edx, offset Err
	call writestring
	call s42
	
	call chapter4

s42 ENDP	

.data
	
	detail43 db 10,13, "4.3 Data-Related Operators and Directives",10,13
	db "1. OFFSET Operator",10,13
	db "2. PTR Operand",10,13
	db "3. TYPE Operand",10,13
	db "4. LENGTHOF Operand",10,13
	db "5. SIZEOF Operand",10,13
	db "6. LABEL Directive",10,13
	db "7. Back to Chapter 4",10,13
	db "8. Main Menu",10,13
	db "Choose a number: ",0

	ofstOP db 10,13,"OFFSET Operator",10,13,0
	ptrOP db 10,13,"PTR Operand",10,13,0
	typeOP db 10,13,"TYPE Operand",10,13,0
	lgthOP db 10,13,"LENGTHOF Operand",10,13,0
	sizeOP db 10,13,"SIZEOF Operand",10,13,0
	lebel db 10,13,"LABEL Directive",10,13,0
	
	nxt db 10,13, "Next: ",0
	lbl16 LABEL WORD
	lbl32 DWORD 12345678h
	lebeld db 10,13,"lbl16 LABEL WORD",10,13
	db "lbl32 DWORD 12345678h",10,13,0

	ovrd dword 11804910h
	ovrddec db "ovrd dword 11804910h",10,13,0

	list2txt db "list2 dword 2,4,6,8,10",10,13,0

	trylgth db " input + number of element in list2 ",10,13,0
	ptrTry word 1234h
	ptrtxt db "ptrTry word 1234h",10,13,0

.code
s43 PROC	;Data-Related Operators n Directives
	;codes

	mov edx, offset detail43
	call writestring
	call readint
	
	.if (eax==1)
	jmp f1
	.elseif (eax==2)
	jmp f2
	.elseif (eax==3)
	jmp f3
	.elseif (eax==4)
	jmp f4
	.elseif (eax==5)
	jmp f5
	.elseif (eax==6)
	jmp f6
	.elseif (eax==7)
	jmp f7
	.elseif (eax==8)
	jmp f8
	.else
	jmp error
	.endif
	
	f1:
	;OFFSET
	call Clrscr
	mov edx, offset four3
	call writestring
	mov edx, offset ofstOP
	call writestring
	mov edx, offset nxt
	call writestring
	call crlf
	call s43

	f2:
	;PTR
	call Clrscr
	mov edx, offset four3
	call writestring
	mov edx, offset ptrOP
	call writestring
	call crlf
	mov edx, offset ptrtxt
	call writestring
	call crlf

	mov al, byte PTR ptrTry
	
	mov edx, offset axreg
	call writestring
	call writehex

	call crlf
	call s43
	
	f3:
	;TYPE
	call Clrscr
	mov edx, offset four3
	call writestring
	mov edx, offset typeOP
	call writestring
	call crlf

	mov eax, TYPE Ipt1			; Ipt1 db ?

	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf

	mov eax, TYPE ovrd			; ovrd dword 11804910h

	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	call s43

	f4:
	;LENGTHOF
	call Clrscr
	mov edx, offset four3
	call writestring
	mov edx, offset lgthOP
	call writestring
	mov edx, offset list2txt
	call writestring
	call crlf
	mov edx, offset trylgth
	call writestring
	call crlf
	mov edx, offset keyin
	call writestring
	call readint

	mov ebx, LENGTHOF list2
	add eax, ebx

	mov edx, offset eaxreg
	call writestring
	call writeint
 	call crlf
	call s43

	f5:
	;SIZEOFF = LENGTHOF*TYPE
	call Clrscr
	mov edx, offset four3
	call writestring
	mov edx, offset sizeOP
	call writestring
	mov edx, offset list2txt
	call writestring
	call crlf

	mov eax, SIZEOF list2

	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	call s43

	f6:
	;LABEL Directive
	call Clrscr
	mov edx, offset four3
	call writestring
	mov edx, offset lebel
	call writestring
	mov edx, offset lebeld
	call writestring

	mov ax, lbl16				;	lbl16 LABEL WORD
								;	lbl32 DWORD 12345678h
	mov edx, offset axreg
	call writestring
	call writehex
	call crlf
	call s43

	f7:
	call Clrscr
	call chapter4

	f8:
	call Clrscr
	call main

	error:
	mov edx, offset Err
	call writestring
	call s43

call chapter4

s43 ENDP

.data
	detail44 db 10,13,"4.4 Addressing Modes",10,13
	db "1. Indirect Operand",10,13
	db "2. Indexed Operand and Indexed Scaling",10,3
	db "3. Pointers",10,13
	db "4. Back to Chapter 4",10,13
	db "5. Main Menu",10,13
	db "Choose a number: ",0

	indrct db 10,13,"Indirect Operand",10,13,0
	indexd db 10,13,"Indexed Operand and Indexed Scaling",10,3,0
	ptrstitle db 10,13,"Pointers",10,13,0

	indop db "mov ax, list[esi]",10,13,0		
	indsc db "mov eax, list2[esi*TYPE list2]",10,13,0

	pntr dword list
;	list word 2,4,6,8,10
;	list2 dword 2,4,6,8,10

	ptrscode db "mov esi, pntr ;(contains list offset)",10,13
	db "mov ax, [esi]",10,13
	db "mov ax, [esi+2]",10,13,0

.code

s44 PROC	;Indirect Addressing
	;codes

	mov edx, offset detail44
	call writestring
	call readint

	.if (eax==1)
	jmp f1
	.elseif (eax==2)
	jmp f2
	.elseif (eax==3)
	jmp f3
	.elseif (eax==4)
	jmp f4
	.elseif (eax==5)
	jmp f5
	.else
	jmp error
	.endif
	
	f1:
	;Indirect Operand
	call Clrscr
	mov edx, offset four4
	call writestring
	mov edx, offset indrct
	call writestring
	call crlf
	mov edi, offset list	; list word 2,4,6,8,10
	mov ax, [edi]			; list2 dword 2,4,6,8,10
	mov edx, offset axreg
	call writestring
	call writeint
	call crlf

	add edi, 2
	mov ax, [edi]
	mov edx, offset axreg
	call writestring
	call writeint
	call crlf

	add edi, 6
	mov ax , [edi]
	mov edx, offset axreg
	call writestring
	call writeint
	call crlf
	call s44

	f2:
	;Indexed Operand n Index Scaling
	call Clrscr
	mov edx, offset four4
	call writestring
	mov edx, offset indexd
	call writestring
	call crlf
	mov esi, 2
	mov ax, list[esi]				; operand
	; scaling
	mov edx, offset indop
	call writestring
	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf

	mov eax, list2[esi*TYPE list2]	; 2*4=8 (size of element)
	mov edx, offset indsc
	call writestring
	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	call s44

	f3:
	;Pointers
	call Clrscr
	mov edx, offset four4
	call writestring
	mov edx, offset ptrstitle
	call writestring
	call crlf
	mov edx, offset ptrscode
	call writestring
	call crlf
	mov esi, pntr					;ptr declared contains list offset
									;pntr dword list
	mov ax, [esi]					;list word 2,4,6,8,10
	mov edx, offset axreg
	call writestring
	call writeint
	call crlf
	call crlf


	mov ax, [esi+2]					;list word 2,4,6,8,10
	mov edx, offset axreg
	call writestring
	call writeint
	call crlf
	call s44

	f4:
	call Clrscr
	call chapter4

	f5:
	call Clrscr
	call main

	error:
	mov edx, offset Err
	call writestring
	call s44

s44 ENDP
.data
	jplp db 10,13,"JMP and LOOP",10,13,0

.code

s45 PROC	;JMP and LOOP

	mov edx, offset jplp
	call writestring
	call crlf
	mov edx, offset range
	call writestring
	call readint
	call crlf

	.if(eax >= 1 && eax <= 5)
	jmp L1
	.else
	jmp error
	.endif

error:
	mov edx, offset Err
	call writestring
	jmp s45

L1: 
	inc eax
	cmp eax, 10
	jae quit
	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	loop L1		;LOOP

	quit:
	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	call crlf

	call chapter4

s45 ENDP

.data
	Chpt7 db 10,13, "CHAPTER 7",10,13
	db "1. Shift and Rotate Instructions",10,13
	db "2. Shift and Rotate Applications",10,13
	db "3. Multiplication and Division Instructions",10,13
	db "4. Main Menu",10,13
	db "Choose a number: ",0

	sev1 db 10,13, "7.1 Shift and Rotate Instructions",0
	sev2 db 10,13, "7.2 Shift and Rotate Apllication",0
	sev3 db 10,13, "7.3 Data Transfer Instructions",0

	appli db 10,13,"first input * (2^second input)",10,13,0

.code

chapter7 PROC
	;codes
	mov edx, offset Chpt7
	call writestring
	call readint

	.if (eax == 1)
	jmp s1
	.elseif (eax==2)
	jmp s2
	.elseif (eax==3)
	jmp s3
	.elseif (eax==4)
	jmp s4
	.else
	jmp s5
	.endif

	s1:
	call s71

	s2:
	call s72

	s3:
	call s73

	s4:
	jmp main

	s5:
	mov edx,offset Err
	call writestring
	call chapter7

chapter7 ENDP

.data
	detail71 db 10,13,"7.1 Shift and Rotate Instructions",10,13
	db "1. SHL Instruction",10,13
	db "2. Fast Multiplication",10,13
	db "3. SHR Instruction",10,13
	db "4. SAL and SAR Instruction",10,13
	db "5. ROR and ROL Instruction",10,13
	db "6. RCL and RCR Instruction",10,13
	db "7. SHLD Instruction",10,13
	db "8. SHRD Instruction",10,13
	db "9. Back to Chapter 7",10,13
	db "10. MainMenu",10,13
	db "Choose a number: ",0

	shli db 10,13,"SHL Instruction",10,13,0
	fstm db 10,13,"Fast Multiplication: input * (2^input)",10,13,0
	shri db 10,13,"SHR Instruction: ",10,13
	db "input / 2",10,13,0
	salr db 10,13,"SAR Instruction",10,13
	db "input / 2",10,13,0
	rorl db 10,13,"ROR and ROL Instruction",10,13,0
	rclr db 10,13,"RCL and RCR Instruction",10,13,0
	shldi db 10,13,"SHLD Instruction",10,13,0
	shrdi db 10,13,"SHRD Instruction",10,13,0

	shldval db "mov ax, 1234h",10,13
	db "mov bx, 5678h",10,13,0
	shrdval db "mov ax, 5678h",10,13
	db "mov bx, 1234h",10,13,0

	shls db "mov ax, 00100001b",10,13,0
	rots db "mov eax, 10000110b",10,13,0
	rclrs db "mov al, 01000100b",10,13,0
	rcls db "rcl al,3",10,13,0
	rcrs db "rcr al,1",10,13,0
	rors db "ror al, 1",10,13,0
	rols db "rol al, 2",10,13,0

.code

s71 PROC	;Shift n Rotate Instructions

	mov edx, offset detail71
	call writestring
	call readint

	.if (eax==1)
	jmp s1
	.elseif (eax==2)
	jmp s2
	.elseif (eax==3)
	jmp s3
	.elseif (eax==4)
	jmp s4
	.elseif (eax==5)
	jmp s5
	.elseif (eax==6)
	jmp s6
	.elseif (eax==7)
	jmp s7
	.elseif (eax==8)
	jmp s8
	.elseif (eax==9)
	jmp s9
	.elseif (eax==10)
	jmp s10
	.else
	jmp error
	.endif

	s1:
	;SHL---------------------------------
	call Clrscr
	mov edx, offset sev1
	call writestring
	mov edx, offset shli
	call writestring
	call crlf

	mov ax, 00100001b	; 21h
	shl ax, 1		; 10000100b = 84h

	mov edx, offset shls
	call writestring
	call crlf

	mov edx, offset axreg
	call writestring
	call writebin
	call crlf
	call s71

	s2:
	;Fast Multiplication--------------------
	call Clrscr
	mov edx, offset sev1
	call writestring
	mov edx, offset fstm
	call writestring
	mov edx, offset keyin
	call writestring
	call readint
	mov Ipt1, al

	mov edx, offset keyin
	call writestring
	call readint
	mov cl, al

	mov al, Ipt1

	shl al, cl

	mov edx, offset answer
	call writestring
	call writeint
	call crlf
	call crlf
	call s71

	s3:
	;SHR-------------------------
	call Clrscr
	mov edx, offset sev1
	call writestring
	mov edx, offset shri
	call writestring

	mov edx, offset keyin
	call writestring
	call readint

	shr eax, 1		; 8/2^1 = 4

	mov edx, offset answer
	call writestring
	call writeint
	call crlf
	call s71

	s4:
	;SAL (same as SHL) n SAR------------------
	call Clrscr
	mov edx, offset sev1
	call writestring
	mov edx, offset salr
	call writestring
	mov edx, offset keyin
	call writestring
	call readint
	call crlf

	sar eax, 1		; -4/2 = -2

	mov edx, offset eaxreg
	call writestring
	call writeint
	call crlf
	call s71

	s5:
	;ROR n ROL-------------------
	call Clrscr
	mov edx, offset sev1
	call writestring
	mov edx, offset rorl
	call writestring
	call crlf
	clc						; clear flag
	mov eax, 10000110b		

	mov edx, offset rots
	call writestring

	ror al, 1				; 01000011b, CF=0

	mov edx, offset rors
	call writestring
	mov edx, offset eaxreg
	call writestring
	call writebin
	call crlf

	rol al, 2				; 00001101b, CF=1

	mov edx, offset rols
	call writestring
	mov edx, offset eaxreg
	call writestring
	call writebin
	call crlf
	call s71

	s6:
	;RCL n RCR - rotate carry L/R--------------------
	call Clrscr
	mov edx, offset sev1
	call writestring
	mov edx, offset rclr
	call writestring
	call crlf
	mov edx, offset rclrs
	call writestring

	clc				
	mov al,01000100b		; CF = 0,AEX = 01000100b 
	rcl al,3				; CF = 0,AEX = 10001000b
							; CF = 1,AEX = 00010000b /10h
							; CF = 0,AEX = 00100001b
	
	mov edx, offset rcls
	call writestring
	call writebin
	call crlf

	rcr al,1		; CF = 1,AEX = 00010000b /10h

	mov edx, offset rcrs
	call writestring
	call writebin
	call crlf
	call s71

	s7:
	;SHLD-----------------------------------------
	;src most.sig.bit copy to dest least sb
	;dest most sb -> CF
	call Clrscr
	mov edx, offset sev1
	call writestring
	mov edx, offset shldi
	call writestring
	call crlf

	mov ax, 1234h
	mov bx, 5678h
	
	mov edx, offset shldval
	call writestring

	shld ax, bx, 8		;move 4bits to left

	mov edx, offset axreg
	call writestring
	call writehex
	call crlf
	call s71

	s8:
	;SHRD---------------------------------------
	call Clrscr
	mov edx, offset sev1
	call writestring
	mov edx, offset shrdi
	call writestring
	call crlf

	mov ax, 5678h
	mov bx, 1234h

	mov edx, offset shrdval
	call writestring

	shrd ax, bx, 8			;move 8bits to right

	mov edx, offset axreg
	call writestring
	call writehex
	call crlf
	call s71

	s9:
	call Clrscr
	jmp chapter7

	s10:
	call Clrscr
	jmp main

	error:
	mov edx,offset Err
	call writestring
	call s71

s71 ENDP

s72 PROC	;Shift n Rotate Application
	
	mov edx, offset sev2
	call writestring
	mov edx, offset appli
	call writestring
	mov edx, offset keyin
	call writestring
	call readint
	mov Ipt1, al

	mov edx, offset keyin
	call writestring
	call readint
	mov cl, al

	mov al, Ipt1

	shl al, cl

	mov edx, offset answer
	call writestring
	call writeint
	call crlf
	call crlf

	
	call chapter7

s72 ENDP

.data
	detail73 db 10,13,"7.3 Data Transfer Instructions",10,13
	db "1. MUL Instruction",10,13
	db "2. IMUL Instruction",10,13
	db "3. DIV Instruction" ,10,13
	db "4. IDIV Instruction",10,13
	db "5. Back to Chapter 7",10,13
	db "6. MainMenu",10,13
	db "Choose a number: ",0

	mulinst db 10,13,"MUL instruction: input * input",10,13,0
	imulinst db 10,13,"IMUL instruction: input * input",10,13,0
	divinst db 10,13,"DIV instruction: input / input",10,13,0
	idivinst db 10,13,"IDIV instruction: input / input",10,13,0

	dividend dword ?
	divisor dword ?
	keyindend db "Insert dividend value: ",0
	keyinsor db "Insert divisor value: ",0

.code

s73 PROC	;Multiply n Division Instructions

	mov edx, offset detail73
	call writestring
	call readint

	.if (eax==1)
	jmp s1
	.elseif (eax==2)
	jmp s2
	.elseif (eax==3)
	jmp s3
	.elseif (eax==4)
	jmp s4
	.elseif (eax==5)
	jmp s5
	.elseif (eax==6)
	jmp s6
	.else
	jmp error
	.endif

	s1:
	; MUL Instruction--------------------
	call Clrscr
	mov edx, offset sev3
	call writestring
	mov edx, offset mulinst
	call writestring
	mov edx, offset keyin
	call writestring
	call readint
	mov ebx, eax
	mov edx, offset keyin
	call writestring
	call readint

	mul ebx

	mov edx, offset answer
	call writestring
	call writeint
	call crlf
	call s73

	s2:
	;IMUL - sign int multiply
	call Clrscr
	mov edx, offset sev3
	call writestring
	mov edx, offset imulinst
	call writestring
	mov edx, offset keyin
	call writestring
	call readint
	mov ebx, eax
	mov edx, offset keyin
	call writestring
	call readint

	imul ebx

	mov edx, offset answer
	call writestring
	call writeint
	call crlf
	call s73

	s3:
	; DIV Instruction---------
	call Clrscr
	mov edx, offset sev3
	call writestring
	mov edx, offset divinst
	call writestring
	call crlf
	mov edx, offset keyindend
	call writestring
	call readint
	mov dividend, eax

	mov edx, offset keyinsor
	call writestring
	call readint
	mov divisor, eax

	mov eax, dividend
	mov ebx, divisor

	mov edx, 0
	div ebx

 	mov edx, offset answer
	call writestring
	call writeint
	call crlf
	call s73

	s4:
	; IDIV (signed) + CDQ------------------
	call Clrscr
	mov edx, offset sev3
	call writestring
	mov edx, offset idivinst
	call writestring
	call crlf
	mov edx, offset keyindend
	call writestring
	call readint
	mov dividend, eax

	mov edx, offset keyinsor
	call writestring
	call readint
	mov divisor, eax

	mov eax, dividend 
	cdq						; dword --> qword
	mov ebx, divisor

	idiv ebx

	mov edx, offset answer
	call writestring
	call writeint
	call crlf
	call s73

	s5:
	call Clrscr
	jmp chapter7

	s6:
	call Clrscr
	jmp main


	error:
	mov edx,offset Err
	call writestring
	call s73


s73 ENDP


END main
