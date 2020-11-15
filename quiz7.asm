#include<p18F4550.inc>

loop_cnt1	    set	0x00
#include<p18F4550.inc>

		org 0x00
		goto start
		org 0x08
		retfie
		org 0x18
		retfie

on_led1	bcf		PORTD,0,A
		btfss	PORTB,0,A
		return
		bra		on_led1
on_led2	bcf		PORTD,1,A
		btfss	PORTB,1,A
		return
		bra		on_led2

start	clrf	TRISD,A
		setf	TRISB,A
		clrf	PORTD,A

check	btfsc	PORTB,0,A
		call	on_led1
		setf	PORTD,0
		btfsc	PORTB,1,A
		call	on_led2
		setf	PORTD,1
		bra		check



		END
