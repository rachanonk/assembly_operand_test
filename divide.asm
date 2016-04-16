section .bss
	num1
	num2

section .text
	global _start

_start:
	mov eax, num1
	mov ecx, num2
	cdq
	idiv ecx
	mov rax, 60
	mov rdi, 0
	syscall
