#include <stdio.h>
#include <stdlib.h>
int main() {
	myprintf("This is %c test for the %% stupud %c method", 'a', 'b');
	printf("\n");
	myprintf("The numbers %x and %x and %x in hex", 123456, 256, 19);
	printf("\n");
	myprintf("The numbers %d and %d and %d in dec", 23, 435, -19);
	printf("\n");
}
