#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
extern int printd(int);
extern int printx(int);
int myprintf(const char * format, ...) {
	void * memLocation = &format;
	int i;
	int len = 0;
	while (format[len] != '\0') {
		len++;
	}
	int j;
	char * temp;
	char c;
	int in = 0;
	memLocation += sizeof(char *);
	for (i = 0; i < len; i++) {
		if (format[i] == '%') {
			char d = format[i + 1];
			switch(d) {
				case 'c':
					c = *((char *) memLocation);
					putchar(c);
					memLocation += sizeof(char *);
					break;
				case 's':
					j = 0;
					temp = *((char **) memLocation);
					while (temp[j] != '\0') {
						putchar(temp[j]);
						j++;
					}
					memLocation += sizeof(char *);
					break;
				case '%':
					putchar('%');
					break;
				case 'd':
					in = *((int *) memLocation);
					printd(in);
					memLocation += sizeof(int *);
					break;
				case 'x':
					in = *((int *) memLocation);
					printx(in);
					memLocation += sizeof(int *);
					break;
			}
			i++;
	        }
		else {
			putchar(format[i]);
		}
	}
} 
