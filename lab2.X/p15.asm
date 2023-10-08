__config 0x3FB9
list p=16f877A
#include <P16F877A.inc>
    
org 0x00

banksel TRISB
clrf TRISB
movlw 0x07
movwf OPTION_REG
banksel PORTB
    
movlw 0x01
movwf PORTB
bcf STATUS, C
    
Rotate:
    btfss PORTC, 0
    goto RotateRight
    btfsc PORTC, 0
    goto RotateLeft
    
RotateRight:
    rrf PORTB, 1
    call Delay
    rrf PORTB, 1
    call Delay
    goto Rotate
    
RotateLeft:
    rlf PORTB, 1
    call Delay
    rlf PORTB, 1
    call Delay
    goto Rotate
    
Delay:
    clrf TMR0
Check:
    btfss INTCON, T0IF
    goto Check
    bcf INTCON, T0IF
    return

end


