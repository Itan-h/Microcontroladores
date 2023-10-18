__config 0x3F39
list p=16F877A
#include<P16F877A.inc>
;------------------------------
    
cblock 0x20
    count1
    count2
endc
    
    
org 0x00

Start
    bsf STATUS, RP0
    bcf TRISD, 0
    bcf STATUS, RP0
    
Main:
    bsf PORTD, 0
    call Delay
    bcf PORTD, 0
    call Delay
    goto Main
    
Delay 
	decfsz count1
	goto Delay
	decfsz count2
	goto Delay
	#include "ConfigBoard.inc"
	return
	
end
    
    
 
    


