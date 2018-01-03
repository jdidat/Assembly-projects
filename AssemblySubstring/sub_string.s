@ARM Assembly program to find substring in a given string
.section .data
.section .text
.global sub_string
sub_string:
	add r0, r0, r2 //put the end_index into r0
	mov r4, #0 //move a null terminator to a register 
	strb r4, [r0], #0 //place a null terminator at the end_index
	sub r1, r1, $1 //subtracts 1 from start index
	sub r3, r2, r1 //find total size of substring (end - start)
	sub r0, r0, r3 //place pointer at start_index
	bx lr //returns the substring requested
