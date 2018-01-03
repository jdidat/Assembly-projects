#include <stdio.h>
#include <stdlib.h>
extern char * sub_string(char *, int, int);
int main() {
	int start_index, end_index;
	char * in_string = (char *)malloc(sizeof(char));
	char * out_string = (char *)malloc(sizeof(char));
	printf("Enter a string: ");
	scanf("%s", in_string);
	printf("Enter the start index: ");
	scanf("%d", &start_index);
	printf("Enter the end index: ");
	scanf("%d", &end_index);
	out_string = sub_string(in_string, start_index, end_index);
	if (start_index > end_index) {
		out_string = "";
	}
	printf("The substring of the given string is '%s'\n", out_string);
	return 0;
}
