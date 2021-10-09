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
    DDRA = 0x00; PORTA = 0xFF;
    DDRC = 0xFF; PORTC = 0x00;
    unsigned char tmpA = 0x00;
    unsigned char tmpC = 0x00;
    /* Insert your solution below */
    while (1) {
        tmpA = PINA;
	if (tmpA >= 0x0D) {
            tmpC = 0x3F;
	}
	else if (tmpA >= 0x0A) {
	    tmpC = 0x3E;
	}
	else if (tmpA >= 0x07) {
	    tmpC = 0x3C;
	}
	else if (tmpA >= 0x05) {
	    tmpC = 0x38;
	}
	else if (tmpA >= 0x03) {
	    tmpC = 0x70;
	}
	else if (tmpA >= 0x01) {
	    tmpC = 0x60;
	}
	else {
	    tmpC = 0x40;
	}
        PORTC = tmpC;
    }
    return 1;
}
