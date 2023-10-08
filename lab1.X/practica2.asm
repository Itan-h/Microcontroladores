__config 0x3FB9
list p=16F877A
#include <P16F877A.inc> 
errorlevel -302
;----------------------------------------------------------
    
cblock 0x20
    count1
    count2
endc
    
org 0x00
    
inicio 
    bsf STATUS, RP0
    bcf TRISD, 0
    bcf STATUS, RP0
    
Mainloop:
    bsf PORTC, 5
    #INCLUDE "ConfigBoard.inc"
    bsf PORTD, 0
    call Delay
    bsf PORTC, 5
    bcf PORTD, 0
    call Delay
    goto Mainloop
    
Delay 
    decfsz count1
    goto Delay
    decfsz count2
    goto Delay
    #INCLUDE "ConfigBoard.inc"
    return
    
end
    


