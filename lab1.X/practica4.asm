__config 0x3FB9
list p=16F877A
#include <P16F877A.inc> 
;----------------------------------------------------------
    
count equ 0x20
    
org 0x0 
;--------------------------------------
goto Start
    
Start
    bsf STATUS, RP0 
    bcf TRISB, 0 
    bcf STATUS, RP0 
;--------------------------------------
    
Main
    bsf PORTB, 0
    call Delay
    bcf PORTB, 0
    call Delay
    
    goto Main
;--------------------------------------
    
Delay
    ;(500-4)/3+1
    movlw 0xA6
    movwf count
    Loop
        decfsz count, 1
	goto Loop
	return
;--------------------------------------

end