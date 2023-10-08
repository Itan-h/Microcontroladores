__config 0xFF39
list P=16F877A
#include <P16F877A.inc>
    
org 0x00
    
banksel TRISD
bcf TRISD, 3
movlw 0x04
movwf OPTION_REG
banksel PORTD
    
Main:
    bsf PORTD, 3
    call Delay
    bcf PORTD, 3
    call Delay
    goto Main
    
Delay:
    movlw 0xE1
    movwf TMR0
Loop:
    btfss INTCON, TMR0IF
    goto Loop
    bcf INTCON, TMR0IF
    return
    
end