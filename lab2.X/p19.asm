__config 0xFF39
list P=16F877A
#include <P16F877A.inc>
    
org 0x00
    
banksel TRISB
movlw 0x06
movwf OPTION_REG
bcf TRISB, 5
banksel PORTB
    
Main:
    bsf PORTB, 5
    call Delay
    bcf PORTB, 5
    call Delay
    goto Main
    
Delay:
    movlw 0x64
    movwf TMR0
Loop:
    btfss INTCON, TMR0IF
    goto Loop
    bcf INTCON, TMR0IF
    return
    
end