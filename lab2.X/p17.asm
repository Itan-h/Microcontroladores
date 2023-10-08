__config 0xFF39
list P=16F877A
#include <P16F877A.inc>
    
org 0x00
    
banksel TRISB
clrf TRISB
movlw 0x03
movwf OPTION_REG
banksel PORTB
bsf PORTB, 0
    
Main:
    btfsc PORTC, 0
    goto Rigth
    goto Left
    
Rigth:
    rrf PORTB, 1
    call Delay
    goto Main
    
Left:
    rlf PORTB, 1
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