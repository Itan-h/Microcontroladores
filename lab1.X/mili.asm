__config 0x3FB9
list p=16F877A
#include <P16F877A.inc> 
;----------------------------------------------------------
    
count0 equ 0x20
count1 equ 0x21
    
org 0x0 
;--------------------------------------
goto Start
    
Start
    bsf STATUS, RP0 
    bcf TRISB, 0 
    bcf TRISB, 1
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
	movlw 0x05
	movwf count1

    Dec1
	movlw 0x41
	movwf count0

    Dec0
	decfsz count0, 1
	goto Dec0

	decfsz count1, 1
	goto Dec1
	
    return
    
;--------------------------------------

end








