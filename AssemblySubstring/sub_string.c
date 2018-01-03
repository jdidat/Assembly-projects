#include <stdio.h>
#include <stdlib.h>
char * sub_string(char * in_string, int start_index, int end_index) {
	char * out_string = (char *)malloc(sizeof(char));
	if (start_index > end_index) {
		out_string = "";
		return out_string;
	}
	int i;
	int j = 0;
	for (i = start_index - 1; i < end_index; i++) {
		out_string[j] = in_string[i];
		j++;
	}
	out_string[j] = '\0';
	return out_string;
}
