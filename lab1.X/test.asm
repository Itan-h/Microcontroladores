__config 0xFF39
list p=16F877A
#include<P16F877A.inc>
;------------------------------
    
counter EQU 0x40 ;directiva
 
org 0x00

goto Start
  
    org 0x05
 
Start    
    bsf STATUS, RP0;
    bcf TRISD, 0
    bcf STATUS, RP0
;--------------------------------
    
Main:
    bsf PORTD,0
    call Delay
    bcf PORTD,0
    call Delay
    goto Main
    
    
    
Delay:
    movlw 0xA7
    movwf counter
loop 
    decfsz counter, 1
    goto loop
    return
    
end