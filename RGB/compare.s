@ARM assembly compare program
.section	.data
x_message: 	.asciz "Enter the first number: "
y_message: 	.asciz "Enter the second number: "
x: 		.space 100
y: 		.space 100
output: 	.asciz "%d and %d are equal.\n"
output1: 	.asciz "%d is strictly greater than %d by %d.\n"
in: 		.asciz "%d"
.section	.text
.global		main
main:
	ldr r0, =x_message
	bl printf

	ldr r0, =in
	ldr r1, =x
	bl scanf

	ldr r0, =y_message
	bl printf

	ldr r0, =in
	ldr r1, =y
	bl scanf

	ldr r1, =x
	ldr r1, [r1]
	ldr r2, =y
	ldr r2, [r2]

	cmp r1, r2
	beq equal
	blt less
	bgt great

equal:
	ldr r0, =output
	ldr r1, =x
	ldr r1, [r1]
	ldr r2, =y
	ldr r2, [r2]
	bl printf
	b end

less:
	ldr r0, =output1
	ldr r2, =x
	ldr r2, [r2]
	ldr r1, =y
	ldr r1, [r1]
	sub r3, r1, r2
	bl printf
	b end

great:
	ldr r0, =output1
	ldr r1, =x
	ldr r1, [r1]
	ldr r2, =y
	ldr r2, [r2]
	sub r3, r1, r2
	bl printf
	b end

end:
	mov r0, $0
	bl fflush
	mov r7, $1
	svc $0
	.end
