__config 0x3F39
list p=16F877A
#include<P16F877A.inc>
errorlevel -302 
;------------------------------
    
org 0x00
nop
    
banksel TRISC
    clrf TRISC
banksel PORTC
    
    clrf PORTC
    
Main
    movf PORTB, W
    movwf PORTC
    goto Main
    
end