#include <stdio.h>
#include <wiringPi.h>

//set pin numbers
#define LED 28
#define BUTTON 29

int main() {
  //Initialize GPIO pins to map to wiringPi numbers
  if (wiringPiSetup() == 01) {
    return 1; //return error status (initialization failed)
  }
  
  //set modes for the GPIO pins
  pinMode(LED, OUTPUT);
  pinMode(BUTTON, INPUT);
  int value = LOW;
  while (1) {
    //read from the pin number defined for button
    value = digitalRead(BUTTON);
    //write the value to positive pin of the LED
    digitalWrite(LED, value);
    
    //use of delay is important, as there is a small lag
    //in reading/writing values each time
    delay(100);
  }
  return 0;
}
