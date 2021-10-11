/*	Author: Andrew Shim
 *  Partner(s) Name: 
 *	Lab Section: 21
 *	Assignment: Lab # 3  Exercise # 1
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    /* Insert DDR and PORT initializations */
    DDRD = 0x00; PORTD = 0xFF;
    DDRB = 0xFE; PORTB = 0x00;
    unsigned char tmpB = 0x00;
    unsigned char tmpD = 0x00;
    unsigned char endB = 0x00;
    unsigned short weight = 0x0000;
    /* Insert your solution below */
    while (1) {
        tmpD = PIND;
	tmpB = PINB;
	weight = (tmpD << 1) | (tmpB & 0x01);
	if (weight >= 70) {
	    endB = 0x02;
        }
        else if (weight > 5 && weight < 70) {
	    endB = 0x04;
        }
        else {
	    endB = 0x00;
        }
        PORTB = endB;	
    }
    return 1;
}
