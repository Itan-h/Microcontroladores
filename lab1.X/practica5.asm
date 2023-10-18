__config 0x3F39
list p=16F877A
#include<P16F877A.inc>
;------------------------------
    
cblock 0x20
    counter1
    counter2
    counter3
endc
    
org 0x00

Start
    bsf STATUS, RP0
    clrf TRISD
    bcf STATUS, RP0
    bsf PORTC, 5
    
Main:
    movlw 0x5A
    movwf PORTD
    call Delay
    movlw 0xA5
    movwf PORTD
    call Delay
    goto Main
    
Delay 
    movlw 0x02
    movwf counter3
    movlw 0x45
    movwf counter2
    movlw 0xA8
    movwf counter1
    loop
	decfsz counter1, 1
	goto loop
	decfsz counter2, 1
	goto loop
	decfsz counter3
	goto loop
	nop 
	#include "ConfigBoard.inc"
	return
	
end