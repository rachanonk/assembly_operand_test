;initialised data section
section .data
    ; Define constants
    num1:   equ 100
    num2:   equ 50
    ; initialize message
    msg:    db "Mul is correct\n"

section .text

    global _start

;; entry point
_start:
    ; set num1's value to eax
    mov eax, num1
    ; set num2's value to rcx
    mov ecx, num2
    ; multiply the operands
    imul ecx
	;move the answer into eax
    ; compare rax and 150
    cmp eax, 5000
    ; go to .exit label if rax and 150 are not equal
    jne .exit
    ; go to .rightSum label if rax and 150 are equal
    jmp .right

; Print message that sum is correct
.right:
    ;; write syscall
    mov     rax, 1
    ;; file descritor, standard output
    mov     rdi, 1
    ;; message address
    mov     rsi, msg
    ;; length of message
    mov     rdx, 15
    ;; call write syscall
    syscall
    ; exit from program
    jmp .exit

; exit procedure
.exit:
    ; exit syscall
    mov    rax, 60
    ; exit code
    mov    rdi, 0
    ; call exit syscall
    syscall
