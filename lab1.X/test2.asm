__config 0xFF39
list p=16F877A
#include <P16F877A.inc> 
    
org 0x00
    count EQU 0x40
    
Start
    banksel TRISC
    bcf TRISC, 0 
    banksel PORTC

    
Main
    btfss PORTB,0
    call Routine1
    btfsc PORTB,0
    call Routine2
    goto Main
    
Routine1:
    bsf PORTC, 0
    call delay
    bcf PORTC, 0
    call delay
    goto Main

    
    
Routine2:
    bsf PORTC, 0
    call delay
    call delay
    bcf PORTC, 0
    call delay
    call delay
    goto Main

	
delay:
    movlw 0x04
    movwf count
    loop
	decfsz count, 1
	goto loop
	return
    
end

