__config 0xFF39
#include<P16F877A.INC>
list p=16F877A
    
constante EQU b'00001111'

org 0x00
 
inicio 
    bsf STATUS, RP0
    clrf TRISB
    bcf STATUS, RP0
    movlw constante
    
Main
    movwf PORTB
    goto Main
    
end
