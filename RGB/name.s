@ARM assemly name concatenator
.section	.data
format: 	.asciz "%s"
message:	.asciz "Enter your first name: "
message1:	.asciz "Enter your last name: "
firstName: 	.space 100
lastName:	.space 100
output:		.asciz "Hello, %s %s.\n"
.section	.text
.global		main
main:
	nop
	ldr r0, =message
	bl printf

	ldr r0, =format
	ldr r1, =firstName
	bl scanf

	ldr r0, =message1
	bl printf

	ldr r0, =format
	ldr r1, =lastName
	bl scanf

	ldr r0, =output
	ldr r1, =firstName
	ldr r2, =lastName
	bl printf

	mov r0, $0
	bl fflush
	mov r7, $1
	svc $0

	.end
