/* This creates a software controlled PWM pin. You can use any GPIO pin (these are marked with bold numbers on page 1 of the in-lab handout). Use 100 for the pwmRange, then the value can be anything from 0 (off) to 100 (fully on) for the given pin. The return value is 0 for success. Anything else and you should check the global errno variable to see what went wrong. */
int softPwmCreate (int pin, int initialValue, int pwmRange);


/* This updates the PWM value on the specified pin. The value is checked to be in-range and pins that haven’t previously been initialised via softPwmCreate will be silently ignored. */
void softPwmWrite (int pin, int value);
