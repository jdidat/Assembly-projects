@ARM assembly hello world program
.section	.data
message:	.asciz "Hello, world.\n"
.section	.text
.global		main
main:
	ldr r0, =message	@load message into first argument
	bl printf		@printf(message)

	mov r7, $1	@exit syscall
	svc $0		@wake kernel
	.end
	