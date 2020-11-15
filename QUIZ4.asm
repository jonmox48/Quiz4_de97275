#include<p18F4550.inc>

			org	0x00
    		goto start
			org	0x08
			retfie
			org	0x18
			retfie

			
SMART		MOVLW	B'00101010'
			XORWF	PORTD,F,A

start 		CLRF	TRISD,A
			CLRF	PORTD,A
			CALL	SMART
			INCF	PORTD,1,A


		
			end
