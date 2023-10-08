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
    clrf TRISE
    bcf STATUS, RP0
    
Main:
    bcf PORTE, 0
    call Delay
    movlw 0x02
    bsf PORTE, 0
    goto Main
    
Delay 
    movlw 0x03
    movwf counter3
    movlw 0x8A
    movwf counter2
    movlw 0x54
    movwf counter1
    loop
	decfsz counter1, 1
	goto loop
	decfsz counter2, 1
	goto loop
	decfsz counter3, 1
	goto loop
	nop 
	return
	
end


