#include<p18F4550.inc>

loop_cnt	set	0x00
		
			org	0x00
			goto	start
			org 0x08
			retfie
			org 0x18
			retfie

dup_nop		macro	kk
			variable	i
i=0
			while i	<	kk
			nop
i+=1
			endw
			endm

Delay11ms	movlw	D'250'
			movwf	loop_cnt,A
again		dup_nop	D'217'
			decfsz	loop_cnt,F,A
			bra		again
			return

start		call	Delay11ms	
			nop

			end