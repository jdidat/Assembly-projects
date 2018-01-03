@ARM Assembly program to print hex and decimal numbers using putchar
.section .data
.section .text
.global printx
.global printd
printx:
	mov r6, lr
	mov r7, r0
	mov r8, $0
	b hexLoop
hexLoop:
	AND r5, r7, #15
	PUSH {r5}
	add r8, r8, $1
	lsr r7, r7, $4
	cmp r7, $0
	bne hexLoop
	b hexLoop2
hexLoop2:
	POP {r5}
	cmp r5, $10
	bge hexLoop3
	blt hexLoop4
hexLoop3:
	add r5, r5, $87
	mov r0, r5
	bl putchar
	sub r8, r8, $1
	cmp r8, $0
	bne hexLoop2
	b end
hexLoop4:
	add r5, r5, $48
	mov r0, r5
	bl putchar
	sub r8, r8, $1
	cmp r8, $0
	bne hexLoop2
	b end
end:
	mov lr, r6
	bx lr
printd:
	PUSH {lr}
	PUSH {r8}
	mov r8, #0
	mov r7, r0
	lsr r0, r0, #31
	cmp r0, #0
	beq decLoop2
decLoop:
	mvn r7, r7
	add r7, r7, #1
	mov r0, #45
	bl putchar
decLoop2:
	mov r0, r7
	mov r3, #10
	mov r4, r3
	mov r3, r0
	mov r0, #0
	b decLoop4
decLoop3:
	add r0, r0, #1
	sub r3, r3, r4
decLoop4:
	cmp r3, r4
	bhs decLoop3
	add r8, r8, #1
	PUSH {r3}
	cmp r0, #0
	mov r7, r0
	bne decLoop2
decLoop5:
	POP {r0}
	add r0, r0, #48
	bl putchar
	sub r8, r8, #1
	cmp r8, #0
	bne decLoop5
	b end2
end2:
	POP {r8}
	POP {lr}
	bx lr



