@ARM assembly main function for sub_string.c
.section	.data
format:		.asciz "%s"
format1:	.asciz "%d"
message:	.asciz "Enter a string: "
message1:	.asciz "Enter the start index: "
message2:	.asciz "Enter the end index: "
str:		.space 100
start_index:	.space 100
end_index:	.space 100
substr:		.space 100
output:		.asciz "The substring of the given string is '%s'\n"
.section	.text
.global		main
main:
	nop
	ldr r0, =message
	bl printf

	ldr r0, =format
	ldr r1, =str
	bl scanf

	ldr r0, =message1
	bl printf

	ldr r0, =format1
	ldr r1, =start_index
	bl scanf

	ldr r0, =message2
	bl printf

	ldr r0, =format1
	ldr r1, =end_index
	bl scanf

	ldr r0, =str
	ldr r1, =start_index
	ldr r1, [r1]
	ldr r2, =end_index
	ldr r2, [r2] 
	bl sub_string

	mov r1, r0
	ldr r0, =output
	bl printf

	mov r0, $0
	bl fflush
	mov r7, $1
	svc $0

	.end
