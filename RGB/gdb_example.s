@example program for understanding GDB
.section .data
.section .text
.global main
main:
	nop
	mov r1, $5	@load r1 with integer 5
	cmp r1, $4	@compare r1 to integer 4.. they will not be equal here
	sub r1, r1, $1	@subtract 1 from r1
	cmp r1, $4	@they will be equal here
	sub r1, r1, $4	@now r1 = 3
	cmp r1, $4	@they are no longer equal

	mov r7, $1
	svc $0
	.end
	