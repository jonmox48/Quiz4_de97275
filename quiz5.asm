	#include<p18F4550.inc>	

n			equ D'7'
i			set 0x02
sum			set	0x05			
			
			org 0x00
			goto	start
			org 0x08
			retfie
			org 0x18
			retfie
			
start		CLRF 	sum,A
			CLRF 	i,A

loop		MOVLW 	n
			CPFSGT	i,A
			BRA		sum_lp
			BRA		exit_lp

sum_lp		MOVF 	i,W,A
			ADDWF	sum,F,A
			INCF	i,F,A
			BRA		loop
			
exit_lp		NOP
			MOVWF	0x40, A

			END		