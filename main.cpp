#include <avr/io.h>
#include <util/delay.h>

#define BLINK_DELAY 500

int main(void)
{
	// Set PB2 to output
	DDRB = 1<<3;

	// Write 0 on port B
	PORTB = 0x0;

	while (1)
	{
		// Set PB2 on
		PORTB = 1<<3;
		_delay_ms(BLINK_DELAY);
		// Set PB2 off
		PORTB = 0X0;
		_delay_ms(BLINK_DELAY);
	}
}
