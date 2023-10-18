__config 0x3F39
list p=16F877A
#include<P16F877A.inc>
errorlevel -302 
;------------------------------
    
org 0x00
nop
    
banksel TRISC
    bcf OPTION_REG, 7
    clrf TRISD
    clrf TRISD
    clrf TRISD
banksel PORTC
    movlw 0x20
    movwf PORTC
    bcf PORTA, 3
    
    clrf PORTD    
Main
    movf PORTB, W
    movwf PORTD
    
    goto Main
    
end