__config 0x3F39
list p=16F877A
#include<P16F877A.inc>
;------------------------------
    
counter equ 0x20
    
org 0x00

Start
    bsf STATUS, RP0
    bcf TRISD, 0
    bcf TRISD, 1
    bcf STATUS, RP0
    
Main:
    bcf PORTD, 0
    bcf PORTD, 1
    call Delay
    bsf PORTD, 0
    bsf PORTD, 1
    call Delay
    goto Main
    
Delay 
    clrf counter
    loop
	decfsz counter, 1
	goto loop
	#include "ConfigBoard.inc"
	return
	
end
    
  