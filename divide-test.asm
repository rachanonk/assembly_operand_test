section .data
	num1 equ 123
	num2 equ 50
	msg db "correct"

section .text
	global _start

_start:
	mov edx, 0		;Innitial modulo result register
	mov eax, num1	;put 123 to eax
	mov ecx, num2	;put 50 to divider
	cdq				;Convert Double to Quad
	idiv ecx			;divide 123 by 50
	cmp edx, 23		;if value of modulo result is 23
	jne .exit			;if not goto exit

	cmp eax, 2			;if divide result is 2 times
	jne .exit			;if not goto exit

	jmp .right			;show correctly result

.right:					;print msg 'correct'
	mov rax, 1			;temporary register; when we call a syscal, rax must contain syscall number
	mov rdi, 1			;used to pass 1st argument to functions
	mov rsi, msg		;pointer used to pass 2nd argument to functions
	mov rdx, 8			;used to pass 3rd argument to functions
	syscall				;make a system call with 3 arguments
	jmp .exit			;goto exit

.exit:
	mov rax, 60
	mov rdi, 0
	syscall
