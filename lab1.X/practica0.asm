__config 0x3FB9
list p=16F877A
#include <P16F877A.inc> ;library that include the registers
;set as default
;----------------------------------------------------------
    
count equ 0x20
    
org 0x0 ;dirección del vector de reset
;--------------------------------------
goto Start
    
org 0x05
    
Start
    bsf STATUS, RP0 ; bank 1, rp0 = 1
    bcf TRISB, 0 ; clear bit 0 in portA
    bcf TRISB, 1
    ;movlw 0x07
    ;movwf ADCON1 ; configure PORTA as digital
    bcf STATUS, RP0 ; clear rp0
    
Main
    bsf PORTB, 0
    call Delay
    ;bcf PORTB, 1
    ;bsf PORTB, 1
    bcf PORTB, 0
    call Delay
    
    goto Main
    
Delay
    clrf count
    Loop
        decfsz count, 1
	goto Loop
	return

end


