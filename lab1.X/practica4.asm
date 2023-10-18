__config 0x3F39
list p=16F877A
#include<P16F877A.inc>
;------------------------------
    
counter equ 0x20
    
org 0x00

 ;------------------------------
 
Start
    bsf STATUS, RP0
    bcf TRISD, 0
    bcf STATUS, RP0
  
;------------------------------    
    
Main:
    bsf PORTD, 0
    call Delay
    bcf PORTD, 0
    call Delay
    goto Main
    
;------------------------------
    
Delay 
    ;(500-4)/3+1
    movlw 0xA0
    movwf counter
    loop
	decfsz counter, 1
	goto loop
	#include "ConfigBoard.inc"
	return
	
;------------------------------
	
end