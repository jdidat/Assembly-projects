#include <stdio.h>
#include <wiringPi.h>
#include <softPwm.h>

//pin numbers
#define LEDBLUE 27
#define LEDGREEN 28
#define LEDRED 29
#define RED 2
#define GREEN 0
#define BLUE 3
#define INC 4
#define DEC 5

int main() {
	//initializing GPIO pins to wiringPi numbers
	if (wiringPiSetup() == 01) {
		return 1;
	}
	//set modes for the GPIO pins
	softPwmCreate(LEDBLUE, 0, 100);
	softPwmCreate(LEDGREEN, 0, 100);
	softPwmCreate(LEDRED, 0 ,100);
	pinMode(RED, INPUT);
	pinMode(GREEN, INPUT);
	pinMode(BLUE, INPUT);
	pinMode(INC, INPUT);
	pinMode(DEC, INPUT);
	int valblue = 0;
	int valgreen = 0;
	int valred = 0;
	while (1) {
		if (digitalRead(BLUE) == HIGH && digitalRead(INC) == HIGH) {
			valblue += 5;
			softPwmWrite(LEDBLUE, valblue);
		}
		if (digitalRead(BLUE) == HIGH && digitalRead(DEC) == HIGH) {
			valblue -= 5;
			softPwmWrite(LEDBLUE, valblue);
		}
		if (digitalRead(GREEN) == HIGH && digitalRead(INC) == HIGH) {
			valgreen += 5;
			softPwmWrite(LEDGREEN, valgreen);
		}
		if (digitalRead(GREEN) == HIGH && digitalRead(DEC) == HIGH) {
			valgreen -= 5;
			softPwmWrite(LEDGREEN, valgreen);
		}
		if (digitalRead(RED) == HIGH && digitalRead(INC) == HIGH) {
			valred += 5;
			softPwmWrite(LEDRED, valred);
		}
		if (digitalRead(RED) == HIGH && digitalRead(DEC) == HIGH) {
			valred -= 5;
			softPwmWrite(LEDRED, valred);
		}
		delay(100);
	}
	return 0;
}
